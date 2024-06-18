import 'package:flutter/material.dart';
import 'package:nankai_mower_app/screens/component/bar/app_bar.dart';
import 'package:nankai_mower_app/screens/run/component/main_screen.dart';
import './home/home_screen.dart';
import './run/run_screen.dart';
import './plan/plan_screen.dart';
import './setting/setting_screen.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 1;
  final List<Widget> _pages = [
    HomeScreen(),
    // RunSrceen(),
    MainScreen(),
    PlanScreen(),
    SettingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: homeAppBar(),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.cut), label: "Run"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: "Plan"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
        currentIndex: _currentIndex,
        // 激活颜色
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
