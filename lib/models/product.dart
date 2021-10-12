class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final String image;
  bool isfavourite;

  Product({
    required this.id,
    required this.name,
    required this.category,
    this.price = 0,
    required this.image,
    this.isfavourite = false,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['results']['id'],
      name: json['results']['name'],
      category: json['results']['category'],
      image: json['results']['image'],
    );
  }
}
