import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product_list.dart';
import '../components/product_grid.dart';

enum filterOptions {
  Favorites,
  All,
}

class ProductsOverviewPage extends StatelessWidget {
  ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: const Text('Minha Loja'),
        ),
        actions: [
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
              if (selectedValue == filterOptions.Favorites) {
                provider.showFavoriteOnly();
              } else {
                provider.showAll();
              }
            },
          ),
        ],
      ),
      body: ProductGrid(),
    );
  }
}
