import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: Card(
        margin: EdgeInsets.all(25),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 10),
              Chip(
                backgroundColor: Theme.of(context).colorScheme.primary,
                label: Text(
                  'R\$${cart.totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Spacer(),
              TextButton(
                child: Text('COMPRAR'),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
