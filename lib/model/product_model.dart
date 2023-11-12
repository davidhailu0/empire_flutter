class Product {
  int? id;
  String? name;
  String? detail;
  double? price;

  Product({
    this.id,
    this.name,
    this.detail,
    this.price,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    detail = json["detail"];
    price = json["price"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["name"] = name;
    json["detail"] = detail;
    json["price"] = price;
    return json;
  }
}
