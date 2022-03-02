import 'package:clima/screens/loading_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ClimatApp());
}

class ClimatApp extends StatelessWidget {
  const ClimatApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Climate",
      theme: ThemeData.dark(),
      home: const LoadingScreen(),
    );
  }
}