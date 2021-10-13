import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

class CategoryPage extends StatefulWidget {
  final String category;
  const CategoryPage(this.category, {Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final ScrollController _scrollController = ScrollController();
  List<String> items = [];
  bool loading = false, allLoaded = false;

  // add the api call here

  void fetchData() async {
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
                    return GestureDetector(
                      onTap: null,
                      child: GridTile(
                        child: Icon(Icons.production_quantity_limits_rounded),
                        footer: GridTileBar(
                          title: Text("${widget.category} Product #$index"),
                          trailing: IconButton(
                            icon: Icon(Icons.shopping_cart),
                            onPressed: null,
                          ),
                          backgroundColor: Colors.black54,
                        ),
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
