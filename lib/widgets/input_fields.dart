import 'package:final_note/models/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputFields extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  const InputFields(
      {Key? key, required this.title, required this.hint, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title),
        Container(
          height: 52,
          padding: const EdgeInsets.only(left: 15),
          margin: const EdgeInsets.only(top: 8.0),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(15)),
          child: Row(children: [
            Expanded(
              child: TextFormField(
                
                autofocus: false,
                cursorColor:
                    Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
                controller: controller,
                style: subTitleStyle,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: subTitleStyle,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ]),
        )
      ]),
    );
  }
}
