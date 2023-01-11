import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int randm = Random().nextInt(5) + 1, chance = 2, s = 12, winner = 5;
  var arr = <int>[
    Random().nextInt(5) + 1,
    Random().nextInt(5) + 1,
    Random().nextInt(5) + 1,
    Random().nextInt(5) + 1,
    Random().nextInt(5) + 1,
    Random().nextInt(5) + 1
  ];
  var flag = <int>[0, 0, 0, 0, 0, 0];
  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            "Lottery",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      "Winning no. is $randm",
                      style: const TextStyle(
                          fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      "Chances $chance",
                      style: const TextStyle(
                          fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        if (chance > 0 && winner != 1) {
                          setState(() {
                            if (flag[0] == 0) chance--;
                            flag[0] = 1;
                            if (arr[0] == randm) {
                              winner = 1;
                            } else {
                              winner = 0;
                            }
                          });
                        }
                      },
                      child: customcard(arr, flag, 0)),
                  InkWell(
                      onTap: () {
                        if (chance > 0 && winner != 1) {
                          setState(() {
                            if (flag[1] == 0) chance--;
                            flag[1] = 1;
                            if (arr[1] == randm) {
                              winner = 1;
                            } else {
                              winner = 0;
                            }
                          });
                        }
                      },
                      child: customcard(arr, flag, 1)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        if (chance > 0 && winner != 1) {
                          setState(() {
                            if (flag[2] == 0) chance--;
                            flag[2] = 1;
                            if (arr[2] == randm) {
                              winner = 1;
                            } else {
                              winner = 0;
                            }
                          });
                        }
                      },
                      child: customcard(arr, flag, 2)),
                  InkWell(
                      onTap: () {
                        if (chance > 0 && winner != 1) {
                          setState(() {
                            if (flag[3] == 0) chance--;
                            flag[3] = 1;
                            if (arr[3] == randm) {
                              winner = 1;
                            } else {
                              winner = 0;
                            }
                          });
                        }
                      },
                      child: customcard(arr, flag, 3)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        if (chance > 0 && winner != 1) {
                          setState(() {
                            if (flag[4] == 0) chance--;
                            flag[4] = 1;
                            if (arr[4] == randm) {
                              winner = 1;
                            } else {
                              winner = 0;
                            }
                          });
                        }
                      },
                      child: customcard(arr, flag, 4)),
                  InkWell(
                      onTap: () {
                        if (chance > 0 && winner != 1) {
                          setState(() {
                            if (flag[5] == 0) chance--;
                            flag[5] = 1;
                            if (arr[5] == randm) {
                              winner = 1;
                            } else {
                              winner = 0;
                            }
                          });
                        }
                      },
                      child: customcard(arr, flag, 5)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: 300,
                  height: 80,
                  color: Colors.white,
                  child: func(winner, chance))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.refresh,
            size: 32,
          ),
          onPressed: () {
            setState(() {
              winner = 5;
              chance = 2;
              arr = <int>[
                Random().nextInt(5) + 1,
                Random().nextInt(5) + 1,
                Random().nextInt(5) + 1,
                Random().nextInt(5) + 1,
                Random().nextInt(5) + 1,
                Random().nextInt(5) + 1
              ];
              flag = <int>[0, 0, 0, 0, 0, 0];
              randm = Random().nextInt(5) + 1;
            });
          },
        ),
      ),
    );
  }
}

Widget customcard(List<int> a, List<int> flag, int i) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      height: 150,
      width: 180,
      child: Center(child: (flag[i] == 1) ? Txt("${a[i]}") : Txt("Tap")),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.green,
      ),
    ),
  );
}

Widget func(int winner, int chance) {
  if (winner == 1) {
    return rows("assets/smile.png", "Congratulation 🎉 \nYou Win");
  } else if (chance == 0) {
    return rows("assets/cry.png", "No Chances Left");
  } else if (winner == 0) {
    return rows("assets/cry.png", "      Try Again");
  } else {
    return Container(
      width: 300,
      height: 80,
      color: Colors.white,
    );
  }
}

Widget rows(String a, String b) {
  return Row(
    children: <Widget>[
      Image(
        image: AssetImage("$a"),
        width: 50,
        height: 50,
      ),
      const SizedBox(
        width: 20,
      ),
      Text(
        "$b",
        style: const TextStyle(
          color: Colors.green,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

Widget Txt(a) {
  return Text(
    "$a",
    style: const TextStyle(
      color: Colors.white,
      fontSize: 40,
      fontWeight: FontWeight.bold,
    ),
  );
}
