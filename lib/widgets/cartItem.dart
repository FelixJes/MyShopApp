import 'package:flutter/material.dart';
import 'package:myshopapp/providers/cart.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    required this.id,
    required this.productId,
    required this.price,
    required this.quantity,
    required this.title,
  });

  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you Sure?'),
            content: Text('Do you want ro remove the item from the Cart?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text('Ok'),
              ),
            ],
          ),
        );
      },
      direction: DismissDirection.endToStart,
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
            padding: EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                  child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: FittedBox(child: Text('\$$price')),
              )),
              subtitle: Text('Total: \$${price * quantity}'),
              trailing: Text('\ $quantity X'),
            )),
      ),
    );
  }
}
