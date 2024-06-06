import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'getting_started_screen.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => GettingStartedScreen()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/cartiey.jpeg",
              height: 400,
              width: 400,
            ),
            const SizedBox(
              height: 20,
            ),
            const CupertinoActivityIndicator(
              radius: 20,
            )
          ],
        ),
      ),
    );
  }
}
