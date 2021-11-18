import 'package:final_note/utils/app_name.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(image: AssetImage('assets/images/splash.png')),
            AppName(fontSize: 20),
            Text('assassin_notis@yahoo.mail.au',
                style: TextStyle(fontSize: 12)),
            SizedBox(height: 5.0),
            Text('Application Version 0.1', style: TextStyle(fontSize: 12)),
            Text('Databse Version 1', style: TextStyle(fontSize: 12))
          ],
        ),
      ),
    );
  }
}
