import 'package:api_ktm/constants/network_helper.dart';
import 'package:api_ktm/model/prodect_by_id.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ProductByIdProvider extends ChangeNotifier {
  bool _isLoading = true;
  late bool _isSuccess;
  late bool _error;
  late ProductByIdModel _productByIdModel;

  //getters

  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;
  bool get error => _error;
  ProductByIdModel get productData => _productByIdModel;

  Future<void> fetchProduct(String id) async {
    var url = Uri.parse("${baseUrl}call-back-product-by-id");
    Map reqBody = {"cust_id": "17", "product_id": id};
    try {
      var response = await http.post(url, body: reqBody);
      if (response.statusCode == 200) {
        // print(response.body);
        _isLoading = false;
        _error = false;
        _isSuccess = true;
        _productByIdModel = productByIdModelFromJson(response.body);
      } else {
        _isLoading = false;
        _error = true;
        _isSuccess = false;
      }
    } catch (e) {
      _isLoading = false;
      _error = true;
      _isSuccess = false;
    }
    notifyListeners();
  }

  void onReLoad() {
    _isLoading = true;
    notifyListeners();
  }
}
