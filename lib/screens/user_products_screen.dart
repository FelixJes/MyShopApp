import 'package:flutter/material.dart';
import 'package:myshopapp/providers/products.dart';
import 'package:myshopapp/screens/edit_product_screen.dart';
import 'package:myshopapp/widgets/app_drawer.dart';
import 'package:myshopapp/widgets/user_product_item.dart';
import 'package:provider/provider.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({super.key});

  static const routeName = '/user-Products';
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context, listen: false);
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(title: const Text('Your Products'), actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, EditProductScreen.routeName);
            },
            icon: const Icon(Icons.add))
      ]),
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemBuilder: (context, i) => Column(
              children: [
                UserProductItem(
                    title: productsData.items[i].title,
                    imageUrl: productsData.items[i].imageUrl),
                const Divider(),
              ],
            ),
            itemCount: productsData.items.length,
          )),
    );
  }
}
