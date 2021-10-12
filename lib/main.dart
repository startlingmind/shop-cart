// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
import './screens/products_overview_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductsOverviewScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}





// API CALL

// Future<Products> fetchAlbum() async {
//   const url =
//       "https://startupify-sample-apis.herokuapp.com/products?start=0&rows=100&category=kids";
//   final response = await http.get(Uri.parse(url), headers: {
//     'Accept': 'application/json',
//     'Access-control-allow-origin': '*'
//   });

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return Products.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }

// class Products {
//   int count = 100;
//   List<Results> results = [];

//   Products({required this.count, required this.results});

//   Products.fromJson(Map<String, dynamic> json) {
//     count = json['count'];
//     if (json['results'] != null) {
//       List<Results> results = [];
//       json['results'].forEach((v) {
//         results.add(new Results.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['count'] = this.count;
//     if (this.results != null) {
//       data['results'] = this.results.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Results {
//   String id = "A1";
//   String name = "ABC";
//   String category = "Kids";
//   String image = "noimage";

//   Results(
//       {required this.id,
//       required this.name,
//       required this.category,
//       required this.image});

//   Results.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     category = json['category'];
//     image = json['image'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['category'] = this.category;
//     data['image'] = this.image;
//     return data;
//   }
// }