import 'package:color_changer_app/color_changer_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ColorChangerApp());
}

class ColorChangerApp extends StatelessWidget {
  const ColorChangerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ColorChangerScreen());
  }
}

@override
Widget build(BuildContext context) {
  return MaterialApp(home: ColorChangerScreen());
}
