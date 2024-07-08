import 'package:flutter/material.dart';

AppBar homeAppBar() {
  return AppBar(
    centerTitle: true,
    foregroundColor: Colors.grey,
    backgroundColor: Colors.white,
    elevation: 0,
    // leading: IconButton(
    //     icon: const Icon(Icons.menu, color: Colors.grey),
    //     splashRadius: 15,
    //     onPressed: () {
    //       print('menu pressed');
    //     }),
    title: const Text(
      "Nankai Mower",
      textDirection: TextDirection.ltr,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: Colors.blue,
      ),
    ),
    // actions: <Widget>[
    //   IconButton(
    //       icon: const Icon(Icons.notifications_rounded, color: Colors.grey),
    //       splashRadius: 15,
    //       onPressed: () {
    //         print('action pressed');
    //       }),
    // ],
  );
}
