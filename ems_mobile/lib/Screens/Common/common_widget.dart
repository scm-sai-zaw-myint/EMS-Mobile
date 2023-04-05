import 'package:flutter/material.dart';

typedef EyeCallback = Function();

class CommonWidget {
  static InputDecoration loginInputDecoration(String name) => InputDecoration(
      hintText: name,
      labelText: name,
      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)));
  static InputDecoration passwordInputDecoration(
          String name, Icon icon, EyeCallback callback) =>
      InputDecoration(
          hintText: name,
          labelText: name,
          suffixIcon: IconButton(
            icon: icon,
            onPressed: callback,
          ),
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
  static Padding profileRow(String left, String right) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  left,
                  textAlign: TextAlign.left,
                  style: profileTextStyle(Colors.blue),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  right,
                  textAlign: TextAlign.right,
                  style: profileTextStyle(Colors.black54),
                ),
              ),
            ),
          ],
        ),
      );
  static Text profileTitle(String title) => Text(
        title,
        style: const TextStyle(
            fontSize: 14, color: Colors.blue, fontWeight: FontWeight.bold),
      );
  static TextStyle profileTextStyle(Color color) => TextStyle(
        fontSize: 14,
        color: color,
      );
  static BoxDecoration commonBackground() => const BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/images/img_bg.png"),
          repeat: ImageRepeat.repeat));
  static Text commonLeftLeave(String text) => Text(
        text,
        textAlign: TextAlign.right,
        style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.blue),
      );
}
