class ProductItem {
  String? id;
  String? imageUrl;
  String? title;
  String? price;
  double? priceValue;
  String? sellerAvatar;
  double? aspectRatio;
  String? category;
  String? sellerName;
  bool? isFeatured;
  String? createdAt;

  ProductItem({
    this.id,
    this.imageUrl,
    this.title,
    this.price,
    this.priceValue,
    this.sellerAvatar,
    this.aspectRatio,
    this.category,
    this.sellerName,
    this.isFeatured,
    this.createdAt,
  });

  ProductItem.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    imageUrl = json['imageUrl']?.toString();
    title = json['title']?.toString();
    price = json['price']?.toString();
    priceValue = (json['priceValue'] as num?)?.toDouble();   // ✅ safe cast
    sellerAvatar = json['sellerAvatar']?.toString();
    aspectRatio = (json['aspectRatio'] as num?)?.toDouble(); // ✅ safe cast
    category = json['category']?.toString();
    sellerName = json['sellerName']?.toString();
    isFeatured = json['isFeatured'] as bool?;
    createdAt = json['createdAt']?.toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'title': title,
      'price': price,
      'priceValue': priceValue,
      'sellerAvatar': sellerAvatar,
      'aspectRatio': aspectRatio,
      'category': category,
      'sellerName': sellerName,
      'isFeatured': isFeatured,
      'createdAt': createdAt,
    };
  }
}