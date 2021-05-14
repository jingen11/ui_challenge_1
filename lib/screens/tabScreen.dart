import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import './homeScreen.dart';
import './compassScreen.dart';
import './notiScreen.dart';
import './settingScreen.dart';
import '../const/color.dart';

class TabScreen extends StatefulWidget {
  static const routeName = "/";
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with TickerProviderStateMixin {
  TabController _tabController;
  List<Widget> _pages;
  int _curIndex;
  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
    _pages = [HomeScreen(), CompassScreen(), NotiScreen(), SettingScreen()];
    _curIndex = 0;
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _tabController.addListener(() {
      setState(() {
        _curIndex = _tabController.index;
      });
    });
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          currentIndex: _curIndex,
          elevation: 0,
          selectedItemColor: PRIMARYCOLOR,
          unselectedItemColor: ACCENTCOLOR,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(FontAwesome5.wallet), label: 'Wallet'),
            BottomNavigationBarItem(
              icon: Icon(FontAwesome5.compass),
              label: 'Compass',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesome5.bell),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesome.cog),
              label: 'Setting',
            ),
          ],
          onTap: (value) {
            setState(() {
              _curIndex = value;
            });
            _tabController.animateTo(value);
          },
        ),
        body: TabBarView(
          controller: _tabController,
          children: [..._pages],
        ));
  }
}
