import 'package:flutter/material.dart';

InputDecoration textInputDecorationWidget(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.blue),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green)),
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red)));
}

BoxDecoration buttonStyling() {
  return BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(12.0),
  );
}
