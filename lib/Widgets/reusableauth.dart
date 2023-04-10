import 'package:flutter/material.dart';

AppBar appBarMain(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.blue,
    centerTitle: true,
    title: const Text(
      "Chat With Me",
      style: TextStyle(color: Colors.white),
    ),
  );
}

InputDecoration fieldinputdecoration(
    String hinttext, IconData icon, Color color) {
  return InputDecoration(
    hintText: hinttext,
    hintStyle: const TextStyle(
      color: Colors.white70,
    ),
    prefixIcon: Icon(
      icon,
      size: 20,
      color: color,
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
  );
}

TextStyle textStyle() {
  return const TextStyle(color: Colors.white, fontSize: 18);
}

TextFormField _textFormField() {
  return TextFormField(
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20)
      )
    ),
  );
}
