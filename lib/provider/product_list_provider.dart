import 'package:api_ktm/constants/network_helper.dart';
import 'package:api_ktm/model/productlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ProductListProvider extends ChangeNotifier {
  bool _isLoading = true;
  late bool _isSuccess;
  late bool _error;
  List<ProducListModel> _productsModel = [];

  //getters

  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;
  bool get error => _error;
  List<ProducListModel> get productData => _productsModel;

  Future<void> getProductData() async {
    var url = Uri.parse("${baseUrl}call-back-products-by-loc");
    Map reqBody = {"location_id": "429"};
    try {
      var response = await http.post(url, body: reqBody);
      if (response.statusCode == 200) {
        //print(response.body);
        _isLoading = false;
        _error = false;
        _isSuccess = true;
        _productsModel = productModelFromJson(response.body);
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
}
