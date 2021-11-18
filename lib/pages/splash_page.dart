import 'package:final_note/pages/home_page.dart';
import 'package:final_note/utils/app_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToHomePage();
  }

  void _navigateToHomePage() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    Get.to(() => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image.asset('assets/images/splash.png'),
            ),
          ),
          const AppName(fontSize: 20),
          // RichText(
          //   text: const TextSpan(
          //     text: 'Slim',
          //     style: TextStyle(
          //         fontSize: 26,
          //         color: Colors.black54,
          //         fontWeight: FontWeight.w500),
          //     children: [
          //       TextSpan(
          //           text: 'to Do', style: TextStyle(color: Colors.amberAccent)),
          //     ],
          //   ),
          // ),
           Text(
            "Keep up with daily task",
            style: TextStyle(
              color: Get.isDarkMode ? Colors.grey[400] : Colors.black45,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
