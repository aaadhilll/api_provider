import 'package:api_ktm/constants/network_helper.dart';
import 'package:api_ktm/provider/product_byid_provider.dart';
import 'package:api_ktm/provider/product_list_provider.dart';
import 'package:api_ktm/view/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<ProductListProvider>(context, listen: false).getProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Products")),
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
                            return ListTile(
                              title: Text(value.productData[i].proName),
                              leading: Image(
                                  image: NetworkImage(
                                      imageBase + value.productData[i].image)),
                              onTap: () {
                                Provider.of<ProductByIdProvider>(context,
                                        listen: false)
                                    .onReLoad();
                                Provider.of<ProductByIdProvider>(context,
                                        listen: false)
                                    .fetchProduct(value.productData[i].id);
                                Get.to(() => const ProductDetail());
                              },
                            );
                          });
        },
      ),
    );
  }
}
