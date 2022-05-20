import 'dart:convert';

ProductByIdModel productByIdModelFromJson(String str) =>
    ProductByIdModel.fromJson(json.decode(str));

class ProductByIdModel {
  ProductByIdModel({
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
    required this.category,
    required this.inCart,
    required this.cartQty,
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
  String category;
  String inCart;
  String cartQty;

  factory ProductByIdModel.fromJson(Map<String, dynamic> json) =>
      ProductByIdModel(
        id: json["id"] ?? "",
        companyId: json["company_id"],
        productId: json["product_id"],
        categoryId: json["category_id"],
        subcatId: json["subcat_id"],
        price: json["price"],
        sellingPrice: json["selling_price"],
        qty: json["qty"],
        status: json["status"],
        company: json["company"],
        proName: json["pro_name"],
        image: json["image"],
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
        category: json["category"],
        inCart: json["in_cart"],
        cartQty: json["cart_qty"],
      );
}
