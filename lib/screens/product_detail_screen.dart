import 'package:flutter/material.dart';
import '../providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  //final String title;

  // const ProductDetailScreen(this.title, {Key? key}) : super(key: key);
  static const routeName = "/product-detail";

  @override
  Widget build(BuildContext context) {
    final productid = ModalRoute.of(context)!.settings.arguments as String;
    final LoadedProductTitle =
        Provider.of<Products>(context, listen: false).findByCategory('kids');
    return Scaffold(
      appBar: AppBar(title: Text(LoadedProductTitle.name)),
    );
  }
}
