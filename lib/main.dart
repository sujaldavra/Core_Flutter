import 'package:flutter/material.dart';
void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Gst(),
    ),
  );
}
class Gst extends StatefulWidget {
  const Gst({Key? key}) : super(key: key);
  @override
  State<Gst> createState() => _GstState();
}
class _GstState extends State<Gst> {
  var Box1 = 0;
  var Box2 = 0;
  var Box3 = 0;
  var Box4 = 0;
  var Box5 = 0;
  var Val = 0;
  var prs = 0;
  var GST = 0;
  var MyStyle = const TextStyle(fontSize: 30);
  var input = 0;
  var finalPrice = 0;
  var m1 = [7, 4, 1, "00"];
  var m2 = [8, 5, 2, 0];
  var m3 = [9, 6, 3, "."];
  var pr = ["3%", "5%", "12%", "18%", "28%"];
  var Decor = BoxDecoration(
    color: Colors.deepOrange,
    borderRadius: BorderRadius.circular(10),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 35,
                    width: 400,
                    color: Colors.grey.shade300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "ORIGINAL PRICE",
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(width: 25),
                        Container(
                          width: 200,
                          alignment: Alignment.center,
                          child: Text(
                            "$input Rs.",
                            style: const TextStyle(fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 80,
                    width: 400,
                    color: Colors.grey.shade300,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(height: 40),
                            Text(
                              "GST",
                              style: TextStyle(fontSize: 21),
                            ),
                            SizedBox(height: 35),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: pr.map((e) {
                            return InkWell(
// splashColor: Colors.deepOrange,
                              onTap: () {
                                setState(() {
                                  if (e == "3%") {
                                    prs = 3;
                                    finalPrice = (input * 3 ~/ 100) + input;
                                    GST = (finalPrice - input) ~/ 2;
                                    Box1 = 1;
                                    Box2 = 0;
                                    Box3 = 0;
                                    Box4 = 0;
                                    Box5 = 0;
                                  } else if (e == "5%") {
                                    finalPrice = (input * 5 ~/ 100) + input;
                                    GST = (finalPrice - input) ~/ 2;
                                    prs = 5;
                                    Box2 = 1;
                                    Box1 = 0;
                                    Box3 = 0;
                                    Box4 = 0;
                                    Box5 = 0;
                                  } else if (e == "12%") {
                                    finalPrice = (input * 12 ~/ 100) + input;
                                    GST = (finalPrice - input) ~/ 2;
                                    prs = 12;
                                    Box3 = 1;
                                    Box1 = 0;
                                    Box2 = 0;
                                    Box4 = 0;
                                    Box5 = 0;
                                  } else if (e == "18%") {
                                    finalPrice = (input * 18 ~/ 100) + input;
                                    GST = (finalPrice - input) ~/ 2;
                                    prs = 18;
                                    Box4 = 1;
                                    Box1 = 0;
                                    Box2 = 0;
                                    Box3 = 0;
                                    Box5 = 0;
                                  } else if (e == "28%") {
                                    finalPrice = (input * 28 ~/ 100) + input;
                                    GST = (finalPrice - input) ~/ 2;
                                    prs = 28;
                                    Box5 = 1;
                                    Box1 = 0;
                                    Box2 = 0;
                                    Box3 = 0;
                                    Box4 = 0;
                                  }
                                });
                              },
                              child: Ink(
                                child: Container(
                                  width: 75,
                                  height: 35,
                                  alignment: Alignment.center,
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  decoration: (e == "3%" && Box1 == 1)
                                      ? Decor
                                      : (e == "5%" && Box2 == 1)
                                      ? Decor
                                      : (e == "12%" && Box3 == 1)
                                      ? Decor
                                      : (e == "18%" && Box4 == 1)
                                      ? Decor
                                      : (e == "28%" && Box5 == 1)
                                      ? Decor
                                      : BoxDecoration(),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 35,
                    width: 400,
                    color: Colors.grey.shade300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "FINAL PRICE",
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(width: 90),
                        Text(
                          "$finalPrice",
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 80,
                    width: 270,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "CGST/SGST",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 9),
                        Text(
                          "$GST",
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
            Expanded(
              flex: 55,
              child: Row(
                children: [
                  Column(
                    children: m1.map((e) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            if (e == 7) {
                              input = (input * 10) + 7;
                            } else if (e == 4) {
                              input = (input * 10) + 4;
                            } else if (e == 1) {
                              input = (input * 10) + 1;
                            } else if (e == "00") {
                              input = input * 100;
                            }
                          });
                        },
                        child: Ink(
                          child: Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 105,
                            color: Colors.white,
                            child: Text(
                              "$e",
                              style: MyStyle,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  Column(
                    children: m2.map((e) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            if (e == 8) {
                              input = (input * 10) + 8;
                            } else if (e == 5) {
                              input = (input * 10) + 5;
                            } else if (e == 2) {
                              input = (input * 10) + 2;
                            } else if (e == 0) {
                              input = input * 10;
                            }
                          });
                        },
                        child: Ink(
                          child: Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 105,
                            color: Colors.white,
                            child: Text(
                              "$e",
                              style: MyStyle,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  Column(
                    children: m3.map((e) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            if (e == 9) {
                              input = (input * 10) + 9;
                            } else if (e == 6) {
                              input = (input * 10) + 6;
                            } else if (e == 3) {
                              input = (input * 10) + 3;
                            }
                          });
                        },
                        child: Ink(
                          child: Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 105,
                            color: Colors.white,
                            child: Text(
                              "$e",
                              style: MyStyle,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            finalPrice = 0;
                            GST = 0;
                            input = 0;
                            prs = 0;
                            Box1 = 0;
                            Box2 = 0;
                            Box3 = 0;
                            Box4 = 0;
                            Box5 = 0;
                          });
                        },
                        child: Ink(
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "AC",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                            height: 200,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      InkWell(
                        onTap: () {
                          setState(() {
                            input = input ~/ 10;
                          });
                        },
                        child: Ink(
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "⌫",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                            height: 200,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}