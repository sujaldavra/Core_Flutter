import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "š List of Fruits",
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
          backgroundColor: Colors.green,
          centerTitle: true,
          //leading: Icon(Icons.menu),
        ),
        body: Center(
          child: RichText(
            text: TextSpan(
              text: "š Apple",
              style: TextStyle(
                color: Colors.red,
                fontSize: 35,
                wordSpacing: 3,
                letterSpacing: 4,
              ),
              children: [
                TextSpan(
                  text: "\nš Greps",
                  style: TextStyle(
                    color: Colors.purpleAccent,
                    fontSize: 35,
                    decoration: TextDecoration.none,
                  ),
                ),
                TextSpan(
                  text: "\nš Cherry",
                  style: TextStyle(
                    color: Colors.purple.shade800,
                    fontSize: 35,
                    decoration: TextDecoration.none,
                  ),

                ),
                TextSpan(
                  text: "\nš Strawberry",
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 35,
                    decoration: TextDecoration.none,
                  ),

                ),
                TextSpan(
                  text: "\nš„­ Mango",
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 35,
                    decoration: TextDecoration.none,
                  ),

                ),
                TextSpan(
                  text: "\nš Pineapple",
                  style: TextStyle(
                    color: Colors.green.shade900,
                    fontSize: 35,
                    decoration: TextDecoration.none,
                  ),

                ),
                TextSpan(
                  text: "\nš Lemon",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 35,
                    decoration: TextDecoration.none,
                  ),

                ),
                TextSpan(
                  text: "\nš Watermelon",
                  style: TextStyle(
                    color: Colors.green.shade400,
                    fontSize: 35,
                    decoration: TextDecoration.none,
                  ),

                ),
                TextSpan(
                  text: "\nš„„ Coconut",
                  style: TextStyle(
                    color: Colors.brown.shade900,
                    fontSize: 35,
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