import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppName extends StatelessWidget {
  final double fontSize;
  const AppName({Key? key, required this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: "Assassins",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: fontSize,
              fontWeight: FontWeight.w900,
              color: Get.isDarkMode ? Colors.grey[400] : Colors.grey[900]),
          children: const <TextSpan>[
            TextSpan(
                text: 'Notis',
                style:
                    TextStyle(fontFamily: 'Poppins', color: Colors.blueAccent))
          ]),
    );
  }
}