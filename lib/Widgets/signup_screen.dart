import 'package:cart/customers/constants.dart';
import 'package:cart/customers/custom_scaffold.dart';
import 'package:cart/customers/custom_text_field.dart';
import 'package:cart/customers/validations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../customers/custom_button.dart';
import '../customers/reusable_widgets.dart';
import 'home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  bool obscureText = true;
  bool isEmailValid = false;
  bool isNameValid = false;
  bool isPasswordValid = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.05; // 5% of screen width

    return CustomScaffold(
      child: DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.7,
        maxChildSize: 1.0,
        builder: (BuildContext context, ScrollController scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.02, // 2% of screen height
                  ),
                  const Center(
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                          fontSize: 35,
                          color: kWhiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  RichText(
                    text: const TextSpan(
                        style: TextStyle(fontSize: 15, color: kWhiteColor),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Please, fill the details to create a '),
                          TextSpan(
                              text: ' Cartiey',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: ' account')
                        ]),
                  ),
                  SizedBox(height: size.height * 0.02),
                  const Text("Full name",
                      style: TextStyle(
                          fontSize: 18,
                          color: kWhiteColor,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: size.height * 0.01),
                  CustomTextField(
                    controller: nameController,
                    hintText: "Full name",
                    onChange: (v) {
                      setState(() {
                        if (Validations.commonValidation(nameController.text)) {
                          isNameValid = true;
                        } else {
                          isNameValid = false;
                        }
                      });
                    },
                    suffix: verificationWidget(
                        color: isNameValid ? kGreenColor : kGreyColor),
                    isValid: isNameValid,
                  ),
                  SizedBox(height: size.height * 0.01),
                  const Text("Email",
                      style: TextStyle(
                          fontSize: 18,
                          color: kWhiteColor,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: size.height * 0.01),
                  CustomTextField(
                    controller: emailController,
                    hintText: "Email",
                    onChange: (v) {
                      setState(() {
                        if (Validations.emailValidationWidthDomain(
                            emailController.text)) {
                          isEmailValid = true;
                        } else {
                          isEmailValid = false;
                        }
                      });
                    },
                    suffix: verificationWidget(
                        color: isEmailValid ? kGreenColor : kGreyColor),
                    isValid: isEmailValid,
                  ),
                  SizedBox(height: size.height * 0.01),
                  const Text("Password",
                      style: TextStyle(
                          fontSize: 18,
                          color: kWhiteColor,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: size.height * 0.01),
                  CustomTextField(
                      controller: passwordController,
                      hintText: "Password",
                      obscureText: obscureText,
                      onChange: (v) {
                        setState(() {
                          if (Validations.commonValidation(
                              passwordController.text)) {
                            isPasswordValid = true;
                          } else {
                            isPasswordValid = false;
                          }
                        });
                      },
                      suffix: CupertinoButton(
                          minSize: 0,
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          child: obscureText
                              ? const Icon(Icons.visibility_off_outlined,
                                  color: kWhiteColor)
                              : const Icon(Icons.visibility_outlined,
                                  color: kWhiteColor)),
                      isValid: isPasswordValid),
                  SizedBox(height: size.height * 0.01),
                  const Text(
                    'Password must be at least 6 characters',
                    style: TextStyle(
                        fontSize: 16,
                        color: kWhiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.02),
                  CustomButton(
                    title: 'Sign up',
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()))
                    },
                  ),
                  SizedBox(height: size.height * 0.02),
                  const Center(
                    child: Text(
                      'Or connect with',
                      style: TextStyle(
                          fontSize: 18,
                          color: kWhiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  socialWidget(),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                          fontSize: 20,
                          color: kWhiteColor,
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      CupertinoButton(
                        minSize: 0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                              fontSize: 20,
                              color: kSecondaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Other existing code

  Future<void> signUp() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Successfully signed up
      print('User signed up: ${userCredential.user!.email}');
      // Save email and password securely
      await _secureStorage.write(key: 'email', value: emailController.text);
      await _secureStorage.write(
          key: 'password', value: passwordController.text);
      // Navigate to home screen or show a success message
      //   Navigator.pushReplacement(
      //    context,
      //  MaterialPageRoute(builder: (context) => const HomePage()),
      // );
    } on FirebaseAuthException {
      // Error handling code
      print("error");
    }
  }

  @override
  void initState() {
    super.initState();
    // Retrieve saved email and password when the screen initializes
    _retrieveSavedCredentials();
  }

  Future<void> _retrieveSavedCredentials() async {
    String? email = await _secureStorage.read(key: 'email');
    String? password = await _secureStorage.read(key: 'password');
    if (email != null && password != null) {
      setState(() {
        emailController.text = email;
        passwordController.text = password;
      });
    }
  }

  // Other existing code
}
