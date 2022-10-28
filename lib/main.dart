import 'package:flutter/material.dart';
import 'package:myshopapp/providers/cart.dart';
import 'package:myshopapp/providers/orders.dart';
import 'package:myshopapp/screens/cart_screen.dart';
import 'package:myshopapp/screens/edit_product_screen.dart';
import 'package:myshopapp/screens/orders_screen.dart';
import 'package:myshopapp/screens/user_products_screen.dart';
import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Products()),
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (context) => Orders())
      ],
      child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) =>  ProductDetailScreen(),
            CartScreen.routeName: (ctx) =>  CartScreen(),
            OrdersScreen.routeName: (context) =>  OrdersScreen(),
            UserProductsScreen.routeName: (context) =>  UserProductsScreen(),
            EditProductScreen.routeName:(context) => EditProductScreen(),
          }),
    );
  }
}
