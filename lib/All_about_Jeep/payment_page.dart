import 'package:flutter/material.dart';

import 'ConfirmationPage.dart';

class CreditCardForm extends StatefulWidget {
  @override
  _CreditCardFormState createState() => _CreditCardFormState();
}

class _CreditCardFormState extends State<CreditCardForm> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _cardHolderNameController = TextEditingController();
  final _expMonthController = TextEditingController();
  final _expYearController = TextEditingController();
  final _ccvController = TextEditingController();
  bool _saveCard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.all(0), // Adjust the padding value as needed
          child: Text('Credit Card Payment'),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Credit Card',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: _cardNumberController,
                    decoration: InputDecoration(
                      labelText: 'Card Number',
                      labelStyle: TextStyle(color: Color(0xffab8671)),
                      hintText: 'Enter Card Number', // Example hint text
                      hintStyle: TextStyle(color: Color(0xff734a34)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            16), // Adjust the border radius as needed
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your card number';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: _cardHolderNameController,
                    decoration: InputDecoration(
                      labelText: 'Card Holder Name',
                      labelStyle: TextStyle(color: Color(0xffab8671)),
                      hintText: 'Enter Card Holder Name', // Example hint text
                      hintStyle: TextStyle(color: Color(0xff734a34)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            16), // Adjust the border radius as needed
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your card holder name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _expMonthController,
                          decoration: InputDecoration(
                            labelText: 'Exp. Month',
                            labelStyle: TextStyle(color: Color(0xffab8671)),
                            hintText: 'Enter Month', // Example hint text
                            hintStyle: TextStyle(color: Color(0xff734a34)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  16), // Adjust the border radius as needed
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter expiration month';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: TextFormField(
                          controller: _expYearController,
                          decoration: InputDecoration(
                            labelText: 'Exp. Year',
                            labelStyle: TextStyle(color: Color(0xffab8671)),
                            hintText: 'Enter Year', // Example hint text
                            hintStyle: TextStyle(color: Color(0xff734a34)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  16), // Adjust the border radius as needed
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter expiration year';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    controller: _ccvController,
                    decoration: InputDecoration(
                      labelText: 'CCV',
                      labelStyle: TextStyle(
                          color: Color(0xffab8671)), // Set label text color
                      hintText: 'Enter CCV', // Example hint text
                      hintStyle: TextStyle(color: Color(0xff734a34)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            16), // Adjust the border radius as needed
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your CCV';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: _saveCard,
                      onChanged: (value) {
                        setState(() {
                          _saveCard = value!;
                        });
                      },
                    ),
                    Text('Save card'),
                  ],
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfirmationPage(
                            message: 'Payment successful!',
                          ),
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Pay',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white, // Set text color to white
                        ),
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff734a34)),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.all(8.0),
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                ),
                // Align the text to the center at the bottom of the screen
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      'Powered by paymob',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
