import 'package:cart/All_about_Jeep/payment_page.dart';
import 'package:flutter/material.dart';
import 'ConfirmationPage.dart';

class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  int _currentStep = 0;
  String _paymentMethod = ''; // Variable to store payment method
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff734a34),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Stepper(
            currentStep: _currentStep,
            onStepContinue: () {
              if (_currentStep == 0) {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    _currentStep++;
                  });
                }
              } else if (_currentStep == 1) {
                if (_paymentMethod.isNotEmpty) {
                  if (_paymentMethod == 'Cash') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmationPage(
                          message: ' Confirmed',
                        ),
                      ),
                    );
                  } else if (_paymentMethod == 'Visa') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreditCardForm()),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please select a payment method')),
                  );
                }
              }
            },
            onStepCancel: () {
              if (_currentStep > 0) {
                setState(() {
                  _currentStep--;
                });
              }
            },
            controlsBuilder: (BuildContext context, ControlsDetails controls) {
              return Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: controls.onStepContinue,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          'Continue',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white, // Set text color to white
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
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (_currentStep > 0)
                    TextButton(
                      onPressed: controls.onStepCancel,
                      child: Text(
                        'Back',
                        style: TextStyle(color: Color(0xff734a34)),
                      ),
                    ),
                ],
              );
            },
            steps: [
              Step(
                title: Text('Address'),
                content: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Color(0xffab8671)),
                          hintText: 'Enter Email',
                          hintStyle: TextStyle(color: Color(0xff734a34)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          labelStyle: TextStyle(color: Color(0xffab8671)),
                          hintText: 'Enter Phone',
                          hintStyle: TextStyle(color: Color(0xff734a34)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Address',
                          labelStyle: TextStyle(color: Color(0xffab8671)),
                          hintText: 'Enter Address',
                          hintStyle: TextStyle(color: Color(0xff734a34)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your address';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'City',
                          labelStyle: TextStyle(color: Color(0xffab8671)),
                          hintText: 'Enter City',
                          hintStyle: TextStyle(color: Color(0xff734a34)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your city';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Country',
                          labelStyle: TextStyle(color: Color(0xffab8671)),
                          hintText: 'Enter Country',
                          hintStyle: TextStyle(color: Color(0xff734a34)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your country';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Step(
                title: Text('Complete'),
                content: Column(
                  children: [
                    RadioListTile<String>(
                      title: Text('Visa'),
                      value: 'Visa',
                      groupValue: _paymentMethod,
                      onChanged: (String? value) {
                        setState(() {
                          _paymentMethod = value!;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: Text('Cash'),
                      value: 'Cash',
                      groupValue: _paymentMethod,
                      onChanged: (String? value) {
                        setState(() {
                          _paymentMethod = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
