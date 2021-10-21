import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';
import '../widgets/product_item.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class CategoryPage extends StatefulWidget {
  final String category;
  // final List items;
  CategoryPage(this.category, {Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final ScrollController _scrollController = ScrollController();
  // List<String> items = [];
  bool loading = false, allLoaded = false;

  // add the api call here

  Future<List<Result>> fetchData() async {
    if (allLoaded) {
      return [];
    }
    setState(() {
      loading = true;
    });
    //await Future.delayed(Duration(milliseconds: 500));
    var url =
        'https://startupify-sample-apis.herokuapp.com/products?start=0&rows=100&category=' +
            widget.category;
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print('Data Found');
      Product items = productFromJson(response.body);
      List<Result> arrData = items.results;
      // print(arrData.length);
      return arrData;
    } else {
      print('Error');
      throw Exception('Failed to Fetch Data');
    }

    List<Result> newData = arrData.results.length >= 100
        ? []
        : List.generate(
            10, (index) => "List Item ${index + widget.items.length}");
    if (newData.isNotEmpty) {
      widget.items.addAll(newData);
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
    final productData = Provider.of<Product>(context);
    final products = productData.items;
    return LayoutBuilder(builder: (context, constraints) {
      if (widget.items.isNotEmpty) {
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
                  if (index < products.length) {
                    return GestureDetector(
                        onTap: null,
                        child: ProductItem('1', 'Hello',
                            'https://placeimg.com/640/480/fashion'));
                  } else {
                    return Container(
                        width: constraints.maxWidth,
                        height: 50,
                        child: Center(
                          child: Text('Nothing More to load'),
                        ));
                  }
                },
                itemCount: products.length + (allLoaded ? 1 : 0)),
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
