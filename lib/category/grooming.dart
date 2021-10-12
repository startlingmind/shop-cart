import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
//	response.addHeader("Access-Control-Allow-Headers", "custId, appId, Origin, Content-Type, Cookie, X-CSRF-TOKEN, Accept, Authorization, X-XSRF-TOKEN, Access-Control-Allow-Origin");

Map<String, String> get headers => {
      "ocntent-type": "application/json",
      "Accept": "application/json",
      "Access-Control-Allow-Origin":
          "custId, appId, Origin, Content-Type, Cookie, X-CSRF-TOKEN, Accept, Authorization, X-XSRF-TOKEN, Access-Control-Allow-Origin"
    };
Future<Product> fetchData() async {
  var response = await http.get(
      Uri.parse(
          'https://startupify-sample-apis.herokuapp.com/products?start=0&rows=100&category=kids'),
      headers: headers);

  if (response.statusCode == 200) {
    return Product.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('failed to load products');
  }
}

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

class Grooming extends StatefulWidget {
  const Grooming({Key? key}) : super(key: key);

  @override
  _GroomingState createState() => _GroomingState();
}

class _GroomingState extends State<Grooming> {
  final String Url =
      "https://startupify-sample-apis.herokuapp.com/products?start=0&rows=100&category=";

  // Future<Product> fetchData() async {
  //   final response = await http.get(Uri.parse(
  //       'https://startupify-sample-apis.herokuapp.com/products?start=0&rows=100&category=kids'));

  //   if (response.statusCode == 200) {
  //     return Product.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to load items');
  //   }
  // }

  final ScrollController _scrollController = ScrollController();
  List<String> items = [];
  bool loading = false, allLoaded = false;

  // add the api call here
  void fetchData() async {
    // final response = await http.get(Uri.parse(
    //     'https://startupify-sample-apis.herokuapp.com/products?start=0&rows=100&category=kids'));
    // if (response.statusCode == 200 && allLoaded) {
    //   return Product.fromJson(jsonDecode(response.body));
    // } else {
    //   throw Exception('Failed to load items');
    // }
    if (allLoaded) {
      return;
    }
    setState(() {
      loading = true;
    });
    await Future.delayed(Duration(milliseconds: 500));
    List<String> newData = items.length >= 100
        ? []
        : List.generate(10, (index) => "List Item ${index + items.length}");
    if (newData.isNotEmpty) {
      items.addAll(newData);
    }

    setState(() {
      loading = false;
      allLoaded = newData.isEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !loading) {
        print('new data call');
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (items.isNotEmpty) {
        return Container(
          height: 800,
          child: Stack(children: [
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                controller: _scrollController,
                itemBuilder: (context, index) {
                  if (index < items.length) {
                    return GridTile(
                      child: Icon(Icons.production_quantity_limits_rounded),
                      footer: GridTileBar(
                        title: Text("Category_grooming Product #$index"),
                        trailing: IconButton(
                          icon: Icon(Icons.shopping_cart),
                          onPressed: null,
                        ),
                        backgroundColor: Colors.black54,
                      ),
                    );
                  } else {
                    return Container(
                        width: constraints.maxWidth,
                        height: 50,
                        child: Center(
                          child: Text('Nothing More to load'),
                        ));
                  }
                },
                itemCount: items.length + (allLoaded ? 1 : 0)),
            if (loading) ...[
              Positioned(
                  width: constraints.maxWidth,
                  left: 0,
                  bottom: 80,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ))
            ]
          ]),
        );
      } else {
        return Container(
            child: Center(
          child: CircularProgressIndicator(),
        ));
      }
    });
  }
}
