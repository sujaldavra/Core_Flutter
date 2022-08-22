import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            "Red & White",
            style: TextStyle(
              fontSize: 30.0,
            ),
          ),
          backgroundColor: Colors.red,
          centerTitle: true,
          //leading: Icon(Icons.menu),
        ),
        body: Center(
          child: RichText(
            text: TextSpan(
              text: "          G",
              style: const TextStyle(
                color: Colors.green,
                fontSize: 25,
                letterSpacing: 2,
              ),
              children: [
                const TextSpan(
                  text: "R",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                    decoration: TextDecoration.none,
                  ),
                ),
                const TextSpan(
                  text: "APHICS",
                  style: TextStyle(
                    color: Colors.green,
                    decoration: TextDecoration.none,
                  ),
                ),
                TextSpan(
                  text: "\n  FLUTT",
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    decoration: TextDecoration.none,
                  ),
                ),
                const TextSpan(
                  text: "E",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                    decoration: TextDecoration.none,
                  ),
                ),
                TextSpan(
                  text: "R",
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    decoration: TextDecoration.none,
                  ),
                ),
                const TextSpan(
                  text: "\n        AN",
                  style: TextStyle(
                    color: Colors.green,
                    decoration: TextDecoration.none,
                  ),
                ),
                const TextSpan(
                  text: "D",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                    decoration: TextDecoration.none,
                  ),
                ),
                const TextSpan(
                  text: "ROID",
                  style: TextStyle(
                    color: Colors.green,
                    decoration: TextDecoration.none,
                  ),
                ),
                const TextSpan(
                  text: "\nDESIGN",
                  style: TextStyle(
                    color: Colors.orange,
                    decoration: TextDecoration.none,
                  ),
                ),
                const TextSpan(
                  text: " & ",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                    decoration: TextDecoration.none,
                  ),
                ),
                const TextSpan(
                  text: "DEVELOP",
                  style: TextStyle(
                    color: Colors.orange,
                    decoration: TextDecoration.none,
                  ),
                ),
                const TextSpan(
                  text: "\n           W",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                    decoration: TextDecoration.none,
                  ),
                ),
                TextSpan(
                  text: "EB",
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    decoration: TextDecoration.none,
                  ),
                ),
                const TextSpan(
                  text: "\n       FAS",
                  style: TextStyle(
                    color: Colors.amberAccent,
                    decoration: TextDecoration.none,
                  ),
                ),
                const TextSpan(
                  text: "H",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                    decoration: TextDecoration.none,
                  ),
                ),
                const TextSpan(
                  text: "ION",
                  style: TextStyle(
                    color: Colors.amberAccent,
                    decoration: TextDecoration.none,
                  ),
                ),
                const TextSpan(
                  text: "\n ANIMAT",
                  style: TextStyle(
                    color: Colors.teal,
                    decoration: TextDecoration.none,
                  ),
                ),
                const TextSpan(
                  text: "I",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                    decoration: TextDecoration.none,
                  ),
                ),
                const TextSpan(
                  text: "ON",
                  style: TextStyle(
                    color: Colors.teal,
                    decoration: TextDecoration.none,
                  ),
                ),
                TextSpan(
                  text: "\n            I",
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    decoration: TextDecoration.none,
                  ),
                ),
                const TextSpan(
                  text: "T",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                    decoration: TextDecoration.none,
                  ),
                ),
                const TextSpan(
                  text: "A - cs+",
                  style: TextStyle(
                    color: Colors.orange,
                    decoration: TextDecoration.none,
                  ),
                ),
                const TextSpan(
                  text: "\n      GAM",
                  style: TextStyle(
                    color: Colors.orange,
                    decoration: TextDecoration.none,
                  ),
                ),
                const TextSpan(
                  text: "E",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
