import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'AddressScreen.dart';

class BookServicePage extends StatefulWidget {
  final List<Map<String, dynamic>> services;

  const BookServicePage({Key? key, required this.services}) : super(key: key);

  @override
  _BookServicePageState createState() => _BookServicePageState();
}

class _BookServicePageState extends State<BookServicePage> {
  List<Map<String, dynamic>> selectedServices = [];
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _toggleServiceSelection(Map<String, dynamic> service) {
    setState(() {
      if (selectedServices.contains(service)) {
        selectedServices
            .removeWhere((element) => element['name'] == service['name']);
      } else {
        selectedServices.add(service);
      }
    });
  }

  int getTotalPrice() {
    return selectedServices.fold(
        0, (sum, service) => sum + _parsePrice(service['price']));
  }

  int _parsePrice(String priceString) {
    // Remove any non-digit characters from the price string
    String cleanPriceString = priceString.replaceAll(RegExp(r'[^0-9]'), '');
    // Parse the cleaned price string to an integer
    return int.tryParse(cleanPriceString) ?? 0;
  }

  bool _allItemsSelected() {
    return selectedServices.isNotEmpty &&
        selectedDate != null &&
        selectedTime != null;
  }

  @override
  Widget build(BuildContext context) {
    var text = Text(
      'Total Price: \$${getTotalPrice()}',
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Book Service',
          style: TextStyle(color: Colors.white), // Set the desired color here
        ),
        backgroundColor: Color(
            0xff734a34), // Optional: Customize the AppBar background color
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pick a Service:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff000000), // Set the font color
              ),
            ),
            const SizedBox(height: 8),
            Column(
              children: widget.services.map((service) {
                return ListTile(
                  leading: Icon(service['icon']),
                  title: Text(service['name']),
                  subtitle: Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text(service['rate'].toString()), // Convert to string
                    ],
                  ),
                  trailing: Text('\$${service['price'].toString()}'),
                  onTap: () {
                    _toggleServiceSelection(service);
                  },
                  selected: selectedServices.contains(service),
                  selectedTileColor: Colors.grey[200],
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            const Text(
              'Select Date:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff000000), // Set the font color
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: const Text('Choose Date'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Color(0xffab8671), // Font color
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  selectedDate != null
                      ? DateFormat.yMMMd().format(selectedDate!)
                      : 'No date chosen',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Select Time:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff000000), // Set the font color
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _selectTime(context),
                  child: const Text('Choose Time'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Color(0xffab8671), // Font color
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  selectedTime != null
                      ? selectedTime!.format(context)
                      : 'No time chosen',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(thickness: 2),
            const SizedBox(height: 16),
            text,
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_allItemsSelected()) {
                    // Navigate to the page where payment details are completed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddressScreen(),
                      ),
                    );
                  } else {
                    // Show an error message if any required data is missing
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: const Text(
                              'Please make sure all required data is selected.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(16.0), // Add padding
                  child: Text('Continue to Address Details'),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color(0xff734a34), // Font color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(16.0), // Add borderRadius
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
