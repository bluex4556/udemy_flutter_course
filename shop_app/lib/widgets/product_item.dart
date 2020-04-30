import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: GridTile(
          child: Image.network(product.imageURL, fit: BoxFit.cover),
          footer: GridTileBar(
            leading: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},iconSize: 20,
            ),
            trailing: IconButton(
              icon: Icon(Icons.star),
              onPressed: () {},
              iconSize: 20,
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black54,
          ),
        ),
      ),
    );
  }
}
