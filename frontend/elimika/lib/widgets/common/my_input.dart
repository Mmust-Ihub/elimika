// import 'package:elimika/utils/colors.dart';
import 'package:flutter/material.dart';

class MyInput extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  const MyInput(
      {super.key,
      required this.label,
      required this.obscureText,
      required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical:4,horizontal: 8),
          fillColor: Colors.white,
          border: InputBorder.none,
          label: Text(
            label,
          ),
        ),
      ),
    );
  }
}
