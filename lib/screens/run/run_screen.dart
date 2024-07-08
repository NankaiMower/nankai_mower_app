import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nankai_mower_app/screens/component/app_bar.dart';
import 'package:niku/namespace.dart' as n;
import 'package:nankai_mower_app/screens/component/drawer/dashboard.dart';
import 'package:nankai_mower_app/screens/component/drawer/sensor_values.dart';
import 'package:nankai_mower_app/screens/component/drawer/settings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:nankai_mower_app/screens/component/drawer/law_and_policy.dart';

import '../component/drawer.dart';

class RunScreen extends StatefulWidget {
  RunScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RunScreenState();
}

class _RunScreenState extends State<RunScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Dashboard(),
    );
  }
}
