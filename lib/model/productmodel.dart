class ProductModel {
  String? status;
  List<ProductData>? data;

  ProductModel({this.status, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <ProductData>[];
      json['data'].forEach((v) {
        data!.add(new ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductData {
  String? createdDate;
  String? sId;
  int? id;
  String? title;
  String? price;
  String? specialPrice;
  String? image;
  String? category;
  String? subcategory;
  String? remark;
  String? brand;
  String? shop;
  String? shopName;
  String? star;
  String? productCode;
  String? stock;
  String? productName;
  String? img;
  String? unitPrice;
  String? qty;
  String? totalPrice;

  ProductData(
      {this.createdDate,
        this.sId,
        this.id,
        this.title,
        this.price,
        this.specialPrice,
        this.image,
        this.category,
        this.subcategory,
        this.remark,
        this.brand,
        this.shop,
        this.shopName,
        this.star,
        this.productCode,
        this.stock,
        this.productName,
        this.img,
        this.unitPrice,
        this.qty,
        this.totalPrice});

  ProductData.fromJson(Map<String, dynamic> json) {
    createdDate = json['CreatedDate'];
    sId = json['_id'];
    id = json['id'];
    title = json['title'];
    price = json['price'];
    specialPrice = json['special_price'];
    image = json['image'];
    category = json['category'];
    subcategory = json['subcategory'];
    remark = json['remark'];
    brand = json['brand'];
    shop = json['shop'];
    shopName = json['shop_name'];
    star = json['star'];
    productCode = json['product_code'];
    stock = json['stock'];
    productName = json['ProductName'];
    img = json['Img'];
    unitPrice = json['UnitPrice'];
    qty = json['Qty'];
    totalPrice = json['TotalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CreatedDate'] = this.createdDate;
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['special_price'] = this.specialPrice;
    data['image'] = this.image;
    data['category'] = this.category;
    data['subcategory'] = this.subcategory;
    data['remark'] = this.remark;
    data['brand'] = this.brand;
    data['shop'] = this.shop;
    data['shop_name'] = this.shopName;
    data['star'] = this.star;
    data['product_code'] = this.productCode;
    data['stock'] = this.stock;
    data['ProductName'] = this.productName;
    data['Img'] = this.img;
    data['UnitPrice'] = this.unitPrice;
    data['Qty'] = this.qty;
    data['TotalPrice'] = this.totalPrice;
    return data;
  }
}