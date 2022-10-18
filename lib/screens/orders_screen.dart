import 'package:flutter/material.dart';
import 'package:myshopapp/providers/orders.dart' show Orders;
import 'package:myshopapp/widgets/app_drawer.dart';
import 'package:myshopapp/widgets/order_item.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  static const routeName = '/Orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Oders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (context, i) => OrderItem(order: orderData.orders[i]),
        itemCount: orderData.orders.length,
      ),
    );
  }
}
