import 'package:flutter/material.dart';

import '../models/pizza.dart';
import '../models/cart.dart';

class Panier extends StatefulWidget {
  final Cart _cart;
  const Panier(this._cart, {Key? key}) : super(key: key);

  @override
  _PanierState createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panier'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget._cart.totalItems(),
              itemBuilder: (context, index) {
                final cartItem = widget._cart.getCartItem(index);
                return _buildItem(cartItem);
              },
            ),
          ),
          SizedBox(height: 16.0), // Ajout d'un espacement vertical
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total TTC', style: TextStyle(fontSize: 18.0)),
                Text('${widget._cart.calculateTotalPrice()} €', style: TextStyle(fontSize: 18.0)),
              ],
            ),
          ),
          SizedBox(height: 16.0), // Ajout d'un espacement vertical
          ElevatedButton(
            onPressed: () {
              print('Valider');
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Valider',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(CartItem cartItem) {
    return ListTile(
      leading: Image.asset(
        'assets/images/pizza/${cartItem.pizza.image}',
        width: 60,
        height: 60,
      ),
      title: Text(cartItem.pizza.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Prix : ${cartItem.pizza.price} €'),
          Text('Quantité : ${cartItem.quantity}'),
          Text('Sous-Total : ${cartItem.calculateTotalPrice()} €'),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.remove_circle),
            onPressed: () {
              setState(() {
                widget._cart.removeProduct(cartItem.pizza);
              });
            },
          ),
          Text(
            '${cartItem.quantity}',
            style: TextStyle(fontSize: 18.0),
          ),
          IconButton(
            icon: Icon(Icons.add_circle),
            onPressed: () {
              setState(() {
                widget._cart.addProduct(cartItem.pizza);
              });
            },
          ),
        ],
      ),
    );
  }
}
