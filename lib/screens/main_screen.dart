import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:niku/namespace.dart' as n;
import 'package:nankai_mower_app/screens/dashboard.dart';
import 'package:nankai_mower_app/screens/sensor_values.dart';
import 'package:nankai_mower_app/screens/settings.dart';
import 'package:nankai_mower_app/views/logo_widget_drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nankai Mower"),
        titleSpacing: 0,
        elevation: 10,
        shadowColor: Colors.black,
        backgroundColor: Colors.deepPurple,
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Padding(
                  padding: EdgeInsets.all(24),
                  child: FittedBox(child: LogoWidgetDrawer(size: 0.1))),
            ),
            ListTile(
              leading: n.Icon(Icons.speed),
              title: const Text('Dashboard'),
              onTap: () {
                Get.back();
                setState(() {
                  _index = 0;
                });
              },
            ),
            ListTile(
              leading: n.Icon(Icons.line_axis),
              title: const Text('Sensor Values'),
              onTap: () {
                Get.back();
                setState(() {
                  _index = 1;
                });
              },
            ),
            ListTile(
              leading: n.Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Get.back();
                setState(() {
                  _index = 2;
                });
              },
            ),
            ListTile(
              leading: n.Icon(Icons.star),
              title: const Text('monitor'),
              onTap: () async {
                const url = 'http://192.168.0.119:8081/video'; //替换视频跳转地址
                await launchUrlString(url, mode: LaunchMode.inAppBrowserView);
              },
            ),
            ListTile(
              leading: n.Icon(Icons.car_crash),
              title: const Text('stop'),
              onTap: () async {
                const url = 'http://192.168.0.119:8081/stop';
                await launchUrlString(url, mode: LaunchMode.inAppBrowserView);
              },
            ),
            ListTile(
              leading: n.Icon(Icons.delete),
              title: const Text('Delete'),
              onTap: () async {
                const url = 'http://192.168.0.119:8081/delete_file';
                await launchUrlString(url, mode: LaunchMode.inAppBrowserView);
              },
            ),
          ],
        ),
      ),
      body: widget.widgetList[_index],
    );
  }
}