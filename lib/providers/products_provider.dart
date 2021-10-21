// import 'package:flutter/material.dart';
// import '../models/product.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;

// // Future<Product> fetchData() async {
// //   try {
// //     var response = await http.get(Uri.parse(
// //         'https://startupify-sample-apis.herokuapp.com/products?start=0&rows=100'));
// //   } catch (e) {
// //     print(e);
// //   }

// // }

// class Products with ChangeNotifier {
//   List<Product> _items = [];

//   List<Product> get items {
//     return [..._items];
//   }

//   Product findByCategory(String category) {
//     return _items.firstWhere((prod) => prod.category == category);
//   }

//   void add(Product product) {
//     _items.add(product);
//     notifyListeners();
//   }
// }

// // class ProductList {
// //   List<Product> prodList = [];
// //   ProductList({required this.prodList});

// //   ProductList.fromJson(Map<String, dynamic> json) {
// //     if (json['results'] != null) {
// //       prodList;

// //       json['results'].forEach((prod) => prodList.add(prod));
// //     }
// //     ;
// //   }
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     if (this.prodList != null) {
// //       data['results'] = this.prodList.map((v) => v.toJson()).toList();
// //     }
// //     return data;
// //   }
// // }

// // class Product {
// //   String id = "";
// //   String name = "";
// //   String category = "";
// //   // final double price;
// //   String image = '';
// // //  bool isfavourite;

// //   Product({
// //     required this.id,
// //     required this.name,
// //     required this.category,
// //     // this.price = 0,
// //     required this.image,
// //     // this.isfavourite = false,
// //   });
// //   Product.fromJson(Map<String, dynamic> json) {
// //     id = json["id"];
// //     name = json["name"];
// //     category = json["category"];
// //     image = json["image"];
// //   }
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['name'] = this.name;
// //     data['category'] = this.category;
// //     data['image'] = this.image;
// //     return data;
// //   }
// // }
