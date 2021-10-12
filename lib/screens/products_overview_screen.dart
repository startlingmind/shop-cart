import 'package:flutter/material.dart';
import '../category/accessories.dart';
import '../category/shoes.dart';
import '../category/kids.dart';
import '../category/men.dart';
import '../category/women.dart';
import '../category/grooming.dart';

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
              //title: Center(child: Text('MyShop')),
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
              Men(),
              Women(),
              Kids(),
              Shoes(),
              Accessory(),
              Grooming(),
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
