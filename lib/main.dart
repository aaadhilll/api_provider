import 'package:api_ktm/provider/product_by_search_provider.dart';
import 'package:api_ktm/provider/product_by_id_provider.dart';
import 'package:api_ktm/provider/product_list_provider.dart';
import 'package:api_ktm/view/view_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ProductListProvider()),
    ChangeNotifierProvider(create: (_) => ProductByIdProvider()),
    ChangeNotifierProvider(create: (_) => SearchProductsProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
