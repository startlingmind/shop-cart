import 'dart:convert';
import 'package:http/http.dart' as http;
import './product.dart';

class ProductApi {
  static ProductApi? _instance;
  ProductApi._();

  static ProductApi? get instance {
    if (_instance == null) {
      _instance = ProductApi._();
    }
    return _instance;
  }

  Future<List<Product>> getAllProducts() async {
    final product = await http.get(Uri.parse(
        'https://startupify-sample-apis.herokuapp.com/products?start=0&rows=100&category=kids'));

    final List responseBody = jsonDecode(product.body);
    return responseBody.map((e) => Product.fromJson(e)).toList();
  }
}
