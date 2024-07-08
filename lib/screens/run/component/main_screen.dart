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

import '../../component/drawer.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Dashboard(),
    );
  }
}
