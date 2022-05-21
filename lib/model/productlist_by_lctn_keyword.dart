import 'dart:convert';

List<ProductByKeywordModel> productSearchModelFromJson(String str) =>
    List<ProductByKeywordModel>.from(
        json.decode(str).map((x) => ProductByKeywordModel.fromJson(x)));

class ProductByKeywordModel {
  ProductByKeywordModel({
    required this.id,
    required this.proName,
    required this.image,
  });

  String id;
  String proName;
  String image;
  factory ProductByKeywordModel.fromJson(Map<String, dynamic> json) =>
      ProductByKeywordModel(
        id: json["id"] ?? "",
        proName: json["pro_name"] ?? "",
        image: json["image"] ?? "",
      );
}
