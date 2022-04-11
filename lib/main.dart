// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ramf/screens/FlashButton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RAMF',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FlashButton(),
    );
  }
}
