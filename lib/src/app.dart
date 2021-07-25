import 'package:flutter/material.dart';

import 'resources/login.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Login',
      theme: ThemeData(
        primaryColor: Colors.blue.shade100,
      ),
      home: Login(),
    );
  }
}