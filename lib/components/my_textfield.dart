import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final controller;
  final String hintText;
  bool obscureText;
  final Icon icon;
  final bool isPassword;

  MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.icon,
    required this.isPassword,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  void togglePasswordVisibility() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          prefixIcon: widget.icon,
          prefixIconColor: Colors.black87,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black87, width: 2.0),
          ),
          fillColor: Colors.grey.shade100,
          filled: true,
          hintText: widget.hintText,
          hintStyle:
              TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w500),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: togglePasswordVisibility,
                  icon: Icon(widget.obscureText
                      ? Icons.visibility
                      : Icons.visibility_off),
                )
              : null,
          suffixIconColor: Colors.black87,
        ),
      ),
    );
  }
}
