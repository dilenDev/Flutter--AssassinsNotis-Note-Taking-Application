import 'package:final_note/pages/cloud_notes.dart';
import 'package:final_note/pages/mynote_page.dart';
import 'package:final_note/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

//! bottom navigation bar !\\

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; //* bottom navigation bar currunt index
  final PageController _pageController = PageController();

  List<IconData> iconList = [
    FeatherIcons.home,
    FeatherIcons.globe,
    FeatherIcons.user
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(index,
        curve: Curves.easeIn, duration: const Duration(milliseconds: 50));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
      body: PageView(
        controller: _pageController,
        allowImplicitScrolling: false,
        physics: const NeverScrollableScrollPhysics(),
        children: const [MyNotePage(), CloudNotePage(), ProfilePage()],
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      //type: BottomNavigationBarType.shifting,
      type: BottomNavigationBarType.fixed,
      onTap: (index) => onTabTapped(index),
      currentIndex: _currentIndex,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      elevation: 0,
      backgroundColor: Get.isDarkMode ? Colors.grey[900] : Colors.grey[100],
      iconSize: 25,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey[600],
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w500,
      ),
      items: [
        BottomNavigationBarItem(icon: Icon(iconList[0]), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(iconList[1]), label: 'Globe'),
        BottomNavigationBarItem(icon: Icon(iconList[2]), label: 'Profile'),
      ],
    );
  }
}
