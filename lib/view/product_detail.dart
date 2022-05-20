import 'package:api_ktm/constants/network_helper.dart';
import 'package:api_ktm/provider/product_byid_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer<ProductByIdProvider>(
          builder: (context, value, child) {
            return value.isLoading == true
                ? const Center(child: CircularProgressIndicator())
                : value.error
                    ? const Center(child: Text("Something went wrong"))
                    : ListTile(
                        title: Text(value.productData.proName),
                        trailing:
                            Image.network(imageBase + value.productData.image));
          },
        ),
      ),
    );
  }
}
