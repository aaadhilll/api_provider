import 'package:api_ktm/constants/network_helper.dart';
import 'package:api_ktm/getx_controller/controller.dart';
import 'package:api_ktm/provider/product_by_id_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail({Key? key}) : super(key: key);
  final Controller _controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("back"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer<ProductByIdProvider>(
          builder: (context, value, child) {
            return value.isLoading == true
                ? const Center(child: CircularProgressIndicator())
                : value.error
                    ? const Center(child: Text("Something went wrong"))
                    : Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: 250,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: Image.network(
                                      imageBase + value.productData.image)),
                            ),
                            Text(
                              value.productData.proName,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "Price :",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  value.productData.price,
                                  style: const TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "Buy Now :",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  value.productData.sellingPrice,
                                  style: const TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  'Quantity :',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          _controller.incriment();
                                        },
                                        icon: const Icon(Icons.add)),
                                    Obx(
                                      () => Text(
                                        '${_controller.count.value}',
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          _controller.decriment();
                                        },
                                        icon: const Icon(Icons.remove)),
                                  ],
                                ),
                              ],
                            ),
                            Obx(() => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      "Total Price : ",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      "${_controller.count.value * int.parse(
                                            value.productData.sellingPrice,
                                          )}",
                                      style: const TextStyle(fontSize: 20),
                                    )
                                  ],
                                )),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.green)),
                                onPressed: () {},
                                child: const Text(
                                  "Buy Now",
                                  style: TextStyle(fontSize: 20),
                                ))
                          ],
                        ),
                      );
          },
        ),
      ),
    );
  }
}
