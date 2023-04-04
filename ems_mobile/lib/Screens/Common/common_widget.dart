import 'package:flutter/material.dart';
typedef EyeCallback = Function();
class CommonWidget {
  
  static InputDecoration loginInputDecoration(String name) => InputDecoration(
      hintText: name,
      labelText: name,
      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)));
  static InputDecoration passwordInputDecoration(String name, Icon icon, EyeCallback callback) =>
      InputDecoration(
          hintText: name,
          labelText: name,
          suffixIcon: IconButton(icon: icon,onPressed: callback,),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)));
  static ButtonStyle primaryButtonStyle() => ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      );
  static ButtonStyle secondaryButtonStyle() => ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      backgroundColor: const Color.fromARGB(255, 224, 224, 224),
      foregroundColor: Colors.black);
}
