import 'dart:convert';

List<ProducListModel> productModelFromJson(String str) =>
    List<ProducListModel>.from(
        json.decode(str).map((x) => ProducListModel.fromJson(x)));

class ProducListModel {
  ProducListModel({
    required this.id,
    required this.proName,
    required this.price,
    required this.sellingPrice,
    required this.qty,
    required this.attribute,
    required this.image,
    required this.categoryId,
    required this.categoryName,
    required this.shopId,
    required this.companyName,
    required this.taluk,
    required this.longitude,
    required this.latitude,
  });

  String id;
  String proName;
  String price;
  String sellingPrice;
  String qty;
  String attribute;
  String image;
  String categoryId;
  String categoryName;
  String shopId;
  String companyName;
  String taluk;
  String longitude;
  String latitude;

  factory ProducListModel.fromJson(Map<String, dynamic> json) =>
      ProducListModel(
        id: json["id"] ?? "",
        proName: json["pro_name"] ?? "",
        price: json["price"],
        sellingPrice: json["selling_price"] ?? "",
        qty: json["qty"] ?? "",
        attribute: json["attribute"] ?? "",
        image: json["image"],
        categoryId: json["category_id"] ?? "",
        categoryName: json["category_name"] ?? "",
        shopId: json["shop_id"] ?? "",
        companyName: json["company_name"] ?? "",
        taluk: json["taluk"] ?? "",
        longitude: json["longitude"] ?? "",
        latitude: json["latitude"] ?? "",
      );
}
