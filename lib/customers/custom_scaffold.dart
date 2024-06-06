import 'package:flutter/material.dart';

import 'constants.dart';

// ignore: must_be_immutable
class CustomScaffold extends StatefulWidget {
  Widget child;

  CustomScaffold({required this.child, super.key});

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/cars.jpg'), fit: BoxFit.cover)),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.305,
            child: customContainer(context),
          )
        ],
      ),
    );
  }

  Widget customContainer(context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: kTertiaryColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(92))),
      child: widget.child,
    );
  }
}
