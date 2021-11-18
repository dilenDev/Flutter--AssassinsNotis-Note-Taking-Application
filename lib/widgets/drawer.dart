import 'package:final_note/pages/about_page.dart';
import 'package:final_note/pages/settings.dart';
import 'package:final_note/utils/app_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final sb = context.watch<SignInBloc>();
    final List titles = ['Settings', 'About'];

    final List icons = [FeatherIcons.settings, FeatherIcons.info];

    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Get.isDarkMode ? Colors.grey[900] : Colors.grey[100]),
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.10,
                      width: MediaQuery.of(context).size.width * 0.18,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/splash.png"),
                              fit: BoxFit.fill)),
                    ),
                    const SizedBox(height: 10),
                    const AppName(
                      fontSize: 25.0,
                    ),
                  ],
                ),
              ),
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 30),
              itemCount: titles.length,
              shrinkWrap: true,
              separatorBuilder: (ctx, idx) => const Divider(
                height: 0.01,
                
              ),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    titles[index],
                    style:  TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Get.isDarkMode ? Colors.grey[400] : Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                  leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 15,
                      child: Icon(
                        icons[index],
                        size: 17,
                        color: Colors.white,
                      )),
                  onTap: () async {
                    Navigator.pop(context);
                    if (index == 0) {
                      Get.to(() => const SettingsPage());
                    } else if (index == 1) {
                      Get.to(() => const AboutPage());
                    }
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
