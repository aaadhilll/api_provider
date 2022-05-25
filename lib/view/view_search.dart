import 'package:api_ktm/constants/network_helper.dart';
import 'package:api_ktm/view/view_product.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:provider/provider.dart';

import '../provider/product_by_search_provider.dart';
import '../provider/product_by_id_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    focusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var availableHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double availableWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(elevation: 0, toolbarHeight: 0),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,
                child: Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: TextFormField(
                    cursorColor: Colors.grey,
                    focusNode: focusNode,
                    onChanged: (searchText) {
                      if (searchText.isEmpty) {
                        Provider.of<SearchProductsProvider>(context,
                                listen: false)
                            .getSearchData("");
                      }

                      Provider.of<SearchProductsProvider>(context,
                              listen: false)
                          .getSearchData(searchText);
                    },
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                    decoration: const InputDecoration(
                      hintText: "Search Products",
                      border: InputBorder.none,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Consumer<SearchProductsProvider>(
              builder: (context, value, child) {
                return value.isLoading == true
                    ? Center(
                        child: Padding(
                        padding: EdgeInsets.only(top: availableHeight / 3),
                        child: const CircularProgressIndicator(),
                      ))
                    : value.error == true
                        ? const Center(child: Text("Something went wrong"))
                        : value.productData.isEmpty && value.error == false
                            ? const Center(child: Text("No products available"))
                            : SizedBox(
                                width: availableWidth,
                                height: availableHeight - 80,
                                child: ShaderMask(
                                  shaderCallback: (Rect rect) {
                                    return const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.purple,
                                        Colors.transparent,
                                        Colors.transparent,
                                        Colors.purple
                                      ],
                                      stops: [
                                        0.0,
                                        0.08,
                                        1.0,
                                        1.0
                                      ], // 10% purple, 80% transparent, 10% purple
                                    ).createShader(rect);
                                  },
                                  blendMode: BlendMode.dstOut,
                                  child: ListView.builder(
                                    padding: const EdgeInsets.only(top: 20),
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: value.productData.length,
                                    itemBuilder: (context, i) {
                                      return Card(
                                        color: Colors.white,
                                        child: ListTile(
                                          title: Text(
                                              value.productData[i].proName,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Colors.black87)),
                                          trailing: Image.network(imageBase +
                                              value.productData[i].image),
                                          onTap: () {
                                            Provider.of<ProductByIdProvider>(
                                                    context,
                                                    listen: false)
                                                .onReLoad();
                                            Provider.of<ProductByIdProvider>(
                                                    context,
                                                    listen: false)
                                                .fetchProduct(
                                                    value.productData[i].id);
                                            Get.to(() => ProductDetail());
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
              },
            ),
          ],
        ),
      ),
    );
  }
}
