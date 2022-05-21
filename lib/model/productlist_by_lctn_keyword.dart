// To parse this JSON data, do
//
//     final productByIdModel = productByIdModelFromJson(jsonString);

import 'dart:convert';

List<ProductByKeywordModel> productSearchModelFromJson(String str) =>
    List<ProductByKeywordModel>.from(
        json.decode(str).map((x) => ProductByKeywordModel.fromJson(x)));

// String productByIdModelToJson(List<ProductByIdModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductByKeywordModel {
  ProductByKeywordModel({
    required this.id,
    required this.companyId,
    required this.productId,
    required this.categoryId,
    required this.subcatId,
    required this.price,
    required this.sellingPrice,
    required this.qty,
    required this.status,
    required this.company,
    required this.proName,
    required this.image,
    required this.thumb,
    required this.thumbStatus,
    required this.attribute,
    required this.orderBy,
    required this.createdDate,
    required this.createdTime,
    required this.updatedDate,
    required this.updatedTime,
    required this.attributeId,
    required this.attributeValue,
    required this.attributeValueInGram,
  });

  String id;
  String companyId;
  String productId;
  String categoryId;
  String subcatId;
  String price;
  String sellingPrice;
  String qty;
  String status;
  String company;
  String proName;
  String image;
  dynamic thumb;
  String thumbStatus;
  String attribute;
  String orderBy;
  DateTime createdDate;
  String createdTime;
  DateTime updatedDate;
  String updatedTime;
  String attributeId;
  String attributeValue;
  String attributeValueInGram;

  factory ProductByKeywordModel.fromJson(Map<String, dynamic> json) =>
      ProductByKeywordModel(
        id: json["id"] ?? "",
        companyId: json["company_id"] ?? "",
        productId: json["product_id"] ?? "",
        categoryId: json["category_id"] ?? "",
        subcatId: json["subcat_id"] ?? "",
        price: json["price"] ?? "",
        sellingPrice: json["selling_price"] ?? "",
        qty: json["qty"] ?? "",
        status: json["status"] ?? "",
        company: json["company"] ?? "",
        proName: json["pro_name"] ?? "",
        image: json["image"] ?? "",
        thumb: json["thumb"],
        thumbStatus: json["thumb_status"],
        attribute: json["attribute"],
        orderBy: json["order_by"],
        createdDate: DateTime.parse(json["created_date"]),
        createdTime: json["created_time"],
        updatedDate: DateTime.parse(json["updated_date"]),
        updatedTime: json["updated_time"],
        attributeId: json["attribute_id"],
        attributeValue: json["attribute_value"],
        attributeValueInGram: json["attribute_value_in_gram"],
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "company_id": companyId,
  //       "product_id": productId,
  //       "category_id": categoryId,
  //       "subcat_id": subcatId,
  //       "price": price,
  //       "selling_price": sellingPrice,
  //       "qty": qty,
  //       "status": status,
  //       "company": company,
  //       "pro_name": proName,
  //       "image": image,
  //       "thumb": thumb,
  //       "thumb_status": thumbStatus,
  //       "attribute": attribute,
  //       "order_by": orderBy,
  //       "created_date":
  //           "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}",
  //       "created_time": createdTime,
  //       "updated_date":
  //           "${updatedDate.year.toString().padLeft(4, '0')}-${updatedDate.month.toString().padLeft(2, '0')}-${updatedDate.day.toString().padLeft(2, '0')}",
  //       "updated_time": updatedTime,
  //       "attribute_id": attributeId,
  //       "attribute_value": attributeValue,
  //       "attribute_value_in_gram": attributeValueInGram,
  //     };
}
