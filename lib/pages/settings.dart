import 'package:final_note/models/theme.dart';
import 'package:final_note/services/theme_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  void initState() {
    super.initState();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(20.0))),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(20.0)),
            ),
          ),
          title:  Text(
            'Settings', style: headingStyle,
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(15, 20, 20, 50),
          children: [
            ListTile(
              title: const Text('Dark Appearance'),
              leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                child:
                    const Image(image: AssetImage('assets/images/darkmode.png')),
              ),
              trailing: GestureDetector(
                onTap: () {
                  ThemeServices().switchTheme();
                },
                child: Icon(
                  Get.isDarkMode
                      ? Icons.wb_sunny_outlined
                      : Icons.nightlight_round,
                  size: 20.0,
                ),
              ),
            ),
          ],
        ));
  }
}


