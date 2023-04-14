import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/badgee.dart';
import 'package:shop/models/cart.dart';
import '../components/product_grid.dart';

enum filterOptions {
  Favorites,
  All,
}

class ProductsOverviewPage extends StatefulWidget {
  ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  bool _showFavoriteOnly = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: const Text('Minha Loja'),
        ),
        actions: [
          Consumer<Cart>(
            builder: (ctx, cart, child) => Badgee(
              value: cart.itemsCount.toString(),
              child: child!,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart),
            ),
          ),
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Favotitos'),
                value: filterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Todos'),
                value: filterOptions.All,
              ),
            ],
            onSelected: (filterOptions selectedValue) {
              setState(() {
                if (selectedValue == filterOptions.Favorites) {
                  _showFavoriteOnly = true;
                } else {
                  _showFavoriteOnly = false;
                }
              });
            },
          ),
        ],
      ),
      body: ProductGrid(_showFavoriteOnly),
    );
  }
}
