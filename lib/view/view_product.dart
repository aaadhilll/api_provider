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
        title: Text("back"),
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
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Price :",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  value.productData.price,
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Quantity :',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          _controller.incriment();
                                        },
                                        icon: Icon(Icons.add)),
                                    Obx(
                                      () => Text(
                                        '${_controller.count.value}',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          _controller.decriment();
                                        },
                                        icon: Icon(Icons.remove)),
                                  ],
                                ),
                              ],
                            ),
                            Obx(() => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Total Price : ",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      "${_controller.count.value * int.parse(value.productData.price)}",
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                )),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.green)),
                                onPressed: () {},
                                child: Text(
                                  "Order Now",
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
