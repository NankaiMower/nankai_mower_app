import 'package:flutter/material.dart';
import 'package:nankai_mower_app/screens/component/app_bar.dart';
import 'package:nankai_mower_app/screens/component/drawer/dashboard.dart';
import 'package:nankai_mower_app/screens/component/drawer/sensor_values.dart';
import 'package:nankai_mower_app/screens/component/drawer/settings.dart';
import './home/home_screen.dart';
import './run/run_screen.dart';
import './plan/plan_screen.dart';
import './settings/setting_screen.dart';
import 'component/drawer.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 1;
  int _drawerIndex = 1;
  final List<Widget> _pages = [
    HomeScreen(),
    RunScreen(),
    PlanScreen(),
    SettingScreen(),
    Dashboard(),
    const SensorValues(),
    const Settings()
  ];

  void _onItemSelected(int index) {
    setState(() {
      _drawerIndex = index + 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      drawer: CustomDrawer(onItemSelected: _onItemSelected),
      body: _pages[_drawerIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.cut), label: "Run"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: "Plan"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
        currentIndex: _currentIndex,
        // 激活颜色
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _drawerIndex = index;
          });
        },
      ),
    );
  }
}
