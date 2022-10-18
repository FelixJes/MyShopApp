import 'package:flutter/material.dart';
import 'package:myshopapp/providers/products.dart';
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
      drawer: AppDrawer(),
      appBar: AppBar(
          title: Text('Your Products'),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))]),
      body: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemBuilder: (context, i) => Column(
              children: [
                UserProductItem(
                    title: productsData.items[i].title,
                    imageUrl: productsData.items[i].imageUrl),
                Divider(),
              ],
            ),
            itemCount: productsData.items.length,
          )),
    );
  }
}
