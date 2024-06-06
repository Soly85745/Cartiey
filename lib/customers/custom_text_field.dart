import 'package:flutter/material.dart';

import 'constants.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  String hintText;
  Widget suffix;
  bool? obscureText;
  bool isValid;
  TextEditingController controller;
  void Function(String)? onChange;

  CustomTextField(
      {required this.hintText,
      required this.suffix,
      this.obscureText,
      required this.isValid,
      required this.controller,
      required this.onChange,
      super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChange,
      obscureText: widget.obscureText ?? false,
      style: const TextStyle(color: kGreyColor),
      decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: kGreyColor),
          fillColor: kTextFieldBgColor,
          filled: true,
          suffixIcon: widget.suffix,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 23.0, vertical: 18),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color:
                      widget.isValid ? kPrimaryColor : kTextFieldBorderColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: widget.isValid ? kPrimaryColor : Colors.grey,
                  width: 2))),
    );
  }
}
