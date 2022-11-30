import 'package:flutter/material.dart';
import 'package:myshopapp/auth_screen.dart';
import 'package:myshopapp/helpers/custom_route.dart';
import 'package:myshopapp/providers/auth.dart';
import 'package:myshopapp/providers/cart.dart';
import 'package:myshopapp/providers/orders.dart';
import 'package:myshopapp/screens/cart_screen.dart';
import 'package:myshopapp/screens/edit_product_screen.dart';
import 'package:myshopapp/screens/orders_screen.dart';
import 'package:myshopapp/screens/products_overview_screen.dart';
import 'package:myshopapp/screens/splash_screen.dart';
import 'package:myshopapp/screens/user_products_screen.dart';
import 'package:provider/provider.dart';

import './screens/product_detail_screen.dart';
import './providers/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Auth(),
          ),
          ChangeNotifierProxyProvider<Auth, Products>(
            update: (context, auth, previous) => Products(auth.token,
                previous == null ? [] : previous.items, auth.userId),
            create: (context) => Products(null, [], ''),
          ),
          ChangeNotifierProvider(create: (context) => Cart()),
          ChangeNotifierProxyProvider<Auth, Orders>(
            update: (context, auth, previous) => Orders(auth.token,
                previous == null ? [] : previous.orders, auth.userId),
            create: (context) => Orders(null, [], ''),
          ),
        ],
        child: Consumer<Auth>(
          builder: (context, auth, child) => MaterialApp(
              title: 'MyShop',
              theme: ThemeData(
                  primarySwatch: Colors.purple,
                  accentColor: Colors.deepOrange,
                  fontFamily: 'Lato',
                  pageTransitionsTheme: PageTransitionsTheme(builders: {
                    TargetPlatform.android: CoustomPageTransitionBuilder(),
                    TargetPlatform.iOS: CoustomPageTransitionBuilder(),
                  })),
              home: auth.isAuth
                  ? ProductsOverviewScreen()
                  : FutureBuilder(
                      future: auth.tryAutoLogin(),
                      builder: (context, snapshot) =>
                          snapshot.connectionState == ConnectionState.waiting
                              ? SplashScreen()
                              : AuthScreen(),
                    ),
              routes: {
                ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
                CartScreen.routeName: (ctx) => CartScreen(),
                OrdersScreen.routeName: (context) => OrdersScreen(),
                UserProductsScreen.routeName: (context) => UserProductsScreen(),
                EditProductScreen.routeName: (context) => EditProductScreen(),
              }),
        ));
  }
}
