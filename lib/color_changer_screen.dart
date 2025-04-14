import 'dart:math';
import 'package:flutter/material.dart';

class ColorChangerScreen extends StatefulWidget {
  @override
  _ColorChangerScreenState createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  int red = 0, green = 0, blue = 0;
  Color color1 = const Color.fromARGB(255, 0, 0, 0);
  Color color2 = const Color.fromARGB(0, 255, 255, 255); // transparent white
  Color color3 = const Color.fromARGB(255, 0, 0, 0);
  int directionIndex = 0;

  final List<List<Alignment>> gradientAlignments = [
    [Alignment.topCenter, Alignment.bottomCenter], // Vertical
    [Alignment.centerLeft, Alignment.centerRight], // Horizontal
    [Alignment.topLeft, Alignment.bottomRight], // Left-Right
    [Alignment.topRight, Alignment.bottomLeft], // Right-Left
  ];

  void changeColor() {
    final random = Random();

    setState(() {
      red = random.nextInt(256);
      green = random.nextInt(256);
      blue = random.nextInt(256);

      color1 = Color.fromARGB(255, red, green, blue);
      color3 = color1; // Match color1
      color2 = const Color.fromARGB(0, 255, 255, 255); // Transparent white
    });
  }

  void changeDirection() {
    setState(() {
      directionIndex = (directionIndex + 1) % gradientAlignments.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: gradientAlignments[directionIndex][0],
            end: gradientAlignments[directionIndex][1],
            colors: [color1, color2, color3],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Change Color Button
              ElevatedButton(
                onPressed: changeColor,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: Colors.white),
                  foregroundColor: Colors.white,
                ),
                child: const Text("Change Color"),
              ),
              const SizedBox(height: 20),
              Text(
                'Red: $red  Green: $green  Blue: $blue',
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),

              SizedBox(height: 20),

              // Change Direction Button
              ElevatedButton(
                onPressed: changeDirection,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: Colors.white),
                  foregroundColor: Colors.white,
                ),
                child: const Text("Change Direction"),
              ),
              const SizedBox(height: 20),
              Text(
                "Direction: ${["Vertical", "Horizontal", "Left-Right", "Right-Left"][directionIndex]}",
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
