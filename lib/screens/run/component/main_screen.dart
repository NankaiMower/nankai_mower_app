import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nankai_mower_app/screens/component/bar/app_bar.dart';
import 'package:niku/namespace.dart' as n;
import 'package:nankai_mower_app/screens/run/component/dashboard.dart';
import 'package:nankai_mower_app/screens/run/component/sensor_values.dart';
import 'package:nankai_mower_app/screens/run/component/settings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:nankai_mower_app/screens/law_and_policy.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  final widgetList = <Widget>[
    Dashboard(),
    const SensorValues(),
    const Settings()
  ];

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _drawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      // appBar: AppBar(
      //     elevation: 0,
      //     backgroundColor: Colors.white,
      //     foregroundColor: Colors.grey),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(''),
            ),
            ListTile(
              leading: n.Icon(Icons.speed),
              title: const Text('Dashboard'),
              onTap: () {
                Get.back();
                setState(() {
                  _drawerIndex = 0;
                });
              },
            ),
            ListTile(
              leading: n.Icon(Icons.line_axis),
              title: const Text('Sensor Values'),
              onTap: () {
                Get.back();
                setState(() {
                  _drawerIndex = 1;
                });
              },
            ),
            ListTile(
              leading: n.Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Get.back();
                setState(() {
                  _drawerIndex = 2;
                });
              },
            ),
            ListTile(
              leading: n.Icon(Icons.star),
              title: const Text('monitor'),
              onTap: () async {
                const url = 'http://192.168.1.98:8081/video'; //替换视频跳转地址
                await launchUrlString(url, mode: LaunchMode.inAppBrowserView);
              },
            ),
            ListTile(
              leading: n.Icon(Icons.car_crash),
              title: const Text('stop'),
              onTap: () async {
                const url = 'http://192.168.1.98:8081/stop';
                await launchUrlString(url, mode: LaunchMode.inAppBrowserView);
              },
            ),
            ListTile(
              leading: n.Icon(Icons.delete),
              title: const Text('Delete'),
              onTap: () async {
                const url = 'http://192.168.1.98:8081/delete_file';
                await launchUrlString(url, mode: LaunchMode.inAppBrowserView);
              },
            ),
            // ListTile(
            //   leading: n.Icon(Icons.book),
            //   title: const Text('law and policy'),
            //   onTap: () async {
            //     const url = 'http://192.168.1.98:8081/law';
            //     await launchUrlString(url, mode: LaunchMode.inAppBrowserView);
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.book),
              title: const Text('Law and Policy'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LawAndPolicyPage()),
                );
              },
            ),
            ListTile(
              leading: n.Icon(Icons.edit_road),
              title: const Text('mowing route'),
              onTap: () async {
                const url = 'http://192.168.1.98:8081/road';
                await launchUrlString(url, mode: LaunchMode.inAppBrowserView);
              },
            ),
            ListTile(
              leading: n.Icon(Icons.rule),
              title: const Text('appointment'),
              onTap: () async {
                const url = 'http://192.168.1.98:8081/date';
                await launchUrlString(url, mode: LaunchMode.inAppBrowserView);
              },
            ),
            ListTile(
              leading: n.Icon(Icons.timelapse),
              title: const Text('history'),
              onTap: () async {
                const url = 'http://192.168.1.98:8081/history';
                await launchUrlString(url, mode: LaunchMode.inAppBrowserView);
              },
            ),
          ],
        ),
      ),
      body: widget.widgetList[_drawerIndex],
    );
  }
}
