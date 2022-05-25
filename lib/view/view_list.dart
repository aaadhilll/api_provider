import 'package:api_ktm/constants/network_helper.dart';
import 'package:api_ktm/provider/product_by_id_provider.dart';
import 'package:api_ktm/provider/product_list_provider.dart';
import 'package:api_ktm/view/view_product.dart';
import 'package:api_ktm/view/view_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../provider/product_by_search_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<ProductListProvider>(context, listen: false).getProductData();
    Provider.of<SearchProductsProvider>(context, listen: false)
        .getSearchData("a");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(() => const SearchScreen());
          },
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        title: const Text("Search"),
        backgroundColor: Colors.black,
      ),
      body: Consumer<ProductListProvider>(
        builder: (context, value, child) {
          return value.isLoading == true
              ? const Center(child: CircularProgressIndicator())
              : value.error
                  ? const Center(child: Text("Something went wrong"))
                  : value.error == false && value.productData.isEmpty
                      ? const Center(child: Text("Empty List"))
                      : ListView.builder(
                          itemCount: value.productData.length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                height: 100,
                                width: double.infinity,
                                color: Colors.grey[300],
                                child: ListTile(
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(value.productData[i].proName),
                                      Text(value.productData[i].companyName),
                                      Text(
                                          "Mrp :${value.productData[i].price}"),
                                      Text(
                                          "Buy Now:${value.productData[i].sellingPrice}"),
                                    ],
                                  ),
                                  leading: Container(
                                    height: 150,
                                    width: 100,
                                    // child: Image(
                                    //     image: NetworkImage(imageBase +
                                    //         value.productData[i].image)),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(imageBase +
                                                value.productData[i].image),
                                            fit: BoxFit.fill)),
                                  ),
                                  onTap: () {
                                    Provider.of<ProductByIdProvider>(context,
                                            listen: false)
                                        .onReLoad();
                                    Provider.of<ProductByIdProvider>(context,
                                            listen: false)
                                        .fetchProduct(value.productData[i].id);
                                    Get.to(() => ProductDetail());
                                  },
                                ),
                              ),
                            );
                          });
        },
      ),
    );
  }
}
