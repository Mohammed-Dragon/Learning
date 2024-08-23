import 'package:flutter/material.dart';
import 'package:learn/components/my_button.dart';
import 'package:learn/models/peoduct.dart';
import 'package:learn/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  void removeFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Remove this item to the cart?"),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().RemoveFromCart(product);
            },
            child: Text("Yes"),
          )
        ],
      ),
    );
  }

  void payButton(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Connect this app to your payment backend"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Cart",
        ),
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
                ? Center(child: Text("Your cart is empty..."))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.price.toString()),
                        trailing: IconButton(
                            onPressed: () => removeFromCart(context, item),
                            icon: Icon(Icons.remove)),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: MyButton(
              onTap: () => payButton(context),
              child: Text("PAY NOW"),
            ),
          )
        ],
      ),
    );
  }
}
