import 'package:flutter/material.dart';
import 'package:shop_app/category/category_page.dart';

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Center(
                  child: Text('Welcome !',
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold))),
              bottom: TabBar(
                  unselectedLabelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.blue.shade400,
                      Colors.blue.shade300,
                      Colors.blue.shade200,
                    ]),

                    borderRadius: BorderRadius.circular(5),
                    // color: Colors.red,
                  ),
                  // array of categories - dynamic
                  tabs: [
                    TabBarBox('Men'),
                    TabBarBox('Women'),
                    TabBarBox('Kids'),
                    TabBarBox('Shoes'),
                    TabBarBox('Accessories'),
                    TabBarBox('Grooming'),
                  ])),
          body: const TabBarView(
            children: [
              CategoryPage('Men'),
              CategoryPage('Women'),
              CategoryPage('Kids'),
              CategoryPage('Shoes'),
              CategoryPage('Accessories'),
              CategoryPage('Grooming'),
            ],
          )),
    );
  }
}

class TabBarBox extends StatelessWidget {
  final String cat;
  const TabBarBox(this.cat, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.blue.shade900, width: 1),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(cat),
          )),
    );
  }
}
// Widget _defaultloading() {
//   return Container(
//     padding: EdgeInsets.all(15),
//     alignment: Alignment.center,
//     child: CircularProgressIndicator(),
//   );
// }
