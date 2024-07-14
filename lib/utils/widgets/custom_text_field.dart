import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      required this.hintText,
      this.prefix,
      this.color,
      this.controller,
      this.validator,
      this.keyboardType});
  TextInputType? keyboardType;
  String hintText;
  Widget? prefix;
  TextEditingController? controller;
  String? Function(String?)? validator;
  Color? color = Color.fromARGB(255, 238, 237, 237);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextFormField(
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefix,
          filled: true,
          fillColor: color,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }
}
