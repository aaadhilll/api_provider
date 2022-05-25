import 'package:api_ktm/constants/network_helper.dart';
import 'package:flutter/cupertino.dart';

import '../model/productlist_by_lctn_keyword.dart';
import 'package:http/http.dart' as http;

class SearchProductsProvider extends ChangeNotifier {
  bool _isLoading = true;
  late bool _isSuccess;
  late bool _error;
  List<ProductByKeywordModel> _productsModel = [];

  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;
  bool get error => _error;
  List<ProductByKeywordModel> get productData => _productsModel;

  Future<void> getSearchData(String searchKey) async {
    var url = Uri.parse("${baseUrl}call-back-productsearch");
    Map reqBody = {"location_id": "429", "keyword": searchKey};

    try {
      var response = await http.post(url, body: reqBody);
      if (response.statusCode == 200) {
        // print(response.body);
        _isLoading = false;
        _error = false;
        _isSuccess = true;
        _productsModel = productSearchModelFromJson(response.body);
      }
    } catch (e) {
      _isLoading = false;
      _error = true;
      _isSuccess = false;
    }
    notifyListeners();
  }
}
