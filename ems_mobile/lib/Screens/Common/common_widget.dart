import 'package:flutter/material.dart';

class CommonWidget{
  static InputDecoration loginInputDecoration(String name) => InputDecoration(
    hintText: name,
    labelText: name,
    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30)
    )
  );
}