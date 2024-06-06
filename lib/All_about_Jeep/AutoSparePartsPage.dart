import 'package:flutter/material.dart';
import 'HeaderParts.dart';
import 'cart_model.dart';
import 'items_diplay.dart';

import 'cart_page.dart';

class AutoSparePartsPage extends StatefulWidget {
  const AutoSparePartsPage({Key? key});

  @override
  State<AutoSparePartsPage> createState() => _AutoSparePartsPageState();
}

class _AutoSparePartsPageState extends State<AutoSparePartsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Auto Spare Parts"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cartItems: cart.items),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: const [
          SizedBox(
            height: 15,
          ),
          HeaderParts(),
          ItemsDisplay(),
        ],
      ),
    );
  }
}
