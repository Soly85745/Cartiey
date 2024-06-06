import 'package:flutter/material.dart';
import 'AddressScreen.dart';
import 'items_model.dart'; // Assuming AutoSpareParts class is defined in items_model.dart

class CartPage extends StatefulWidget {
  final List<AutoSpareParts> cartItems;

  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double totalCost = 0.0;
  String paymentMethod = 'Cash';
  bool isDelivery = false;

  @override
  void initState() {
    super.initState();
    calculateTotalCost();
  }

  void calculateTotalCost() {
    totalCost = widget.cartItems.fold(0.0, (sum, item) => sum + item.price);
  }

  void addItem(AutoSpareParts item) {
    setState(() {
      widget.cartItems.add(item);
      calculateTotalCost();
    });
  }

  void removeItem(AutoSpareParts item) {
    setState(() {
      widget.cartItems.remove(item);
      calculateTotalCost();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: ListView.builder(
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {
                  AutoSpareParts item = widget.cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffab8671)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        leading: Image.network(
                          item.image,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(item.name),
                        subtitle: Text('\$${item.price}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                removeItem(item); // Call removeItem method
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                addItem(item); // Call addItem method
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total Cost: \$${totalCost.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(),
                const SizedBox(height: 20),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AddressScreen()), // Navigate to CreditCardForm page
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Proceed to Payment',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff734a34)),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.all(8.0)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(16), // Add border radius
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
