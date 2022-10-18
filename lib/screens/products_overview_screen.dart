import 'package:flutter/material.dart';
import 'package:myshopapp/screens/cart_screen.dart';
import 'package:myshopapp/widgets/app_drawer.dart';
import 'package:myshopapp/widgets/badge.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              )
            ],
            icon: Icon(Icons.more_vert),
          ),
          Consumer<Cart>(
            builder: (context, cart, child) => Badge(
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, CartScreen.routeName);
                    },
                    icon: Icon(Icons.shopping_cart)),
                value: cart.itemCount.toString()),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
