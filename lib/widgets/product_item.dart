import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  const ProductItem(this.id, this.title, this.imageUrl, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
          child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(ProductDetailScreen.routeName, arguments: id);
              },
              child: Image.network(imageUrl)),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            // leading: IconButton(
            //   icon: Icon(Icons.favorite),
            //   color: Theme.of(context).accentColor,
            //   onPressed: () {},

            title: Text(title, textAlign: TextAlign.center),
            // trailing: IconButton(
            //   icon: Icon(
            //     Icons.shopping_cart,
            //     color: Theme.of(context).accentColor,
            //   ),
            // onPressed: () {},
          )),
    );
  }
}
