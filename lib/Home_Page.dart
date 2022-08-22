import 'package:flutter/material.dart';
import 'Golobal.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int Questionanswer = 0;
  int winPrice = 500000;
  int won = 0;
  int oops = 0;
  int GameOver = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: (Questionanswer < Question.length && won == 0 && oops == 0)
            ? IndexedStack(
          index: Questionanswer,
          children: Question.map((Map e) {
            return HomePage(data: e);
          }).toList(),
        )
            : (Questionanswer < Question.length && won == 1)
            ? Container(
          alignment: Alignment.center,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const SizedBox(
                height: 150,
                width: 150,
                child: Image(
                  image: AssetImage(
                    'assets/fire-cracker.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              const Text(
                "Your Answer is Correct",
                style: TextStyle(
                  color: Color(0xffc78640),
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "You Won",
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xffc78640),
                ),
              ),
              Text(
                "$winPrice",
                style: const TextStyle(
                  fontSize: 22,
                  color: Color(0xffc78640),
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Questionanswer++;
                    won = 0;
                  });
                },
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xff1e1f23),
                    onPrimary: const Color(0xffd6d6d6),
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 80,
                    )),
              ),
              const Spacer(),
            ],
          ),
        )
            : (Questionanswer < Question.length && oops == 1)
            ? Container(
          alignment: Alignment.center,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const SizedBox(
                height: 150,
                width: 150,
                child: Image(
                  image: AssetImage(
                    'assets/lose.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "oops!",
                style: TextStyle(
                  color: Color(0xffd4d4ff),
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "Sorry You are",
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xffd4d4ff),
                ),
              ),
              const Text(
                "the lose",
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xffd4d4ff),
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Questionanswer = 0;
                    oops = 0;
                    winPrice = 10000;
                  });
                },
                child: const Text(
                  'Try Again',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff1e1f23),
                  onPrimary: const Color(0xffd6d6d6),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 80,
                    vertical: 16,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        )
            : Container(
          alignment: Alignment.center,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const SizedBox(
                height: 150,
                width: 150,
                child: Image(
                  image: AssetImage("assets/fire-cracker.png"),
                  fit: BoxFit.cover,
                ),
              ),
              const Text(
                "Congratulations",
                style: TextStyle(
                    color: Color(0xff5b5f62), fontSize: 22),
              ),
              const SizedBox(height: 25),
              const Text(
                "Game Over",
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xffffffff),
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    Questionanswer = 0;
                    winPrice = 10000;
                  });
                },
                child: const Text(
                  'Restart',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff1e1f23),
                  onPrimary: const Color(0xffd6d6d6),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 80,
                    vertical: 16,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget HomePage({required Map data}) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: 300,
            alignment: Alignment.center,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data['question'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: 500,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                const Spacer(flex: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (Questionanswer < Question.length) {
                            if (data['answer'] == 'A') {
                              winPrice = winPrice * 2;
                              won = 1;
                            } else {
                              oops = 1;
                            }
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          onPrimary: Colors.white,
                          alignment: Alignment.center,
                          minimumSize: const Size(170, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      child: Text("A.${data['A']}"),
                    ),
                    const SizedBox(width: 25),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (Questionanswer < Question.length) {
                            if (data['answer'] == 'B') {
                              winPrice = winPrice * 2;
                              won = 1;
                            } else {
                              oops = 1;
                            }
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          onPrimary: Colors.white,
                          alignment: Alignment.center,
                          minimumSize: const Size(170, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      child: Text("B.${data['B']}"),
                    ),
                  ],
                ),
                const Spacer(flex: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (Questionanswer < Question.length) {
                            if (data['answer'] == 'C') {
                              winPrice = winPrice * 2;
                              won = 1;
                            } else {
                              oops = 1;
                            }
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          onPrimary: Colors.white,
                          alignment: Alignment.center,
                          minimumSize: const Size(170, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      child: Text("C.${data['C']}"),
                    ),
                    const SizedBox(width: 25),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (Questionanswer < Question.length) {
                            if (data['answer'] == 'D') {
                              winPrice = winPrice * 2;
                              won = 1;
                            } else {
                              oops = 1;
                            }
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          onPrimary: Colors.white,
                          alignment: Alignment.center,
                          minimumSize: const Size(170, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      child: Text("D.${data['D']}"),
                    ),
                  ],
                ),
                const Spacer(flex: 4),
              ],
            ),
          ),
        )
      ],
    );
  }
}