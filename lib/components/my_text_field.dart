import "package:flutter/material.dart";

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool hide;
  final TextEditingController controller;

  const MyTextField({super.key , required this.hintText, required this.hide , required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        obscureText: hide,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary,)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary,)
          ),
          fillColor: Theme.of(context).colorScheme.secondary,
          filled: true,
          hintText: hintText,  // Dynamic passing of placeholder
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary,)
        ),
      ),
    );
  }
}