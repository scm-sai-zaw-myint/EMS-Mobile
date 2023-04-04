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

  static Card cardStyle(IconData? cardIcon, text, isImage, imageData) {
    return Card(
      shadowColor: Colors.teal,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.white,
      //color: Colors.black,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: isImage
                ? Tab(
                    icon: Image.asset(
                      '$imageData',
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  )
                : Icon(
                    cardIcon,
                    color: const Color.fromARGB(255, 4, 108, 66),
                    size: 50,
                  ),
          ),
          const Divider(
            color: Colors.white,
            thickness: 1,
            height: 0,
          ),
          Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 4, 108, 66),
            child: TextButton(
              onPressed: () => {},
              child: Text(
                "$text",
                style: const TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
