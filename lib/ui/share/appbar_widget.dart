import 'package:flutter/material.dart';
import 'package:pizzeria/models/cart.dart';

import '../panier.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Cart _cart;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const AppBarWidget(this.title, this._cart, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Panier(_cart),
                ));
          },
          icon: const Icon(Icons.shopping_cart),
        )
      ],
    );
  }
}
