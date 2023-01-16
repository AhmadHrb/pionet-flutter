import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pionet App',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Pionet App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final List<Color> theColor = [];
  final List<String> buttons = ["Do","Ri","Mi","Fa","Sol","La","Si"];
  final List<int> happyBirthday = [3,5,1,3,5,1,2,4,3,5,1,2,4,2,1,5,4,2,3,5];
  final List<int> Do = [];
  final List<int> Ri = [];
  final List<int> Mi = [];
  final List<int> Fa = [];
  final List<int> Sol = [];
  final List<int> La = [];
  final List<int> Si = [];
  var where = 0;

  var current = 0;

  Container addPiano(int i) {

    String btnName = "";
    int btnNum = 0;

    if (i+1 < buttons.length) {
      btnName = buttons[i];
      btnNum = i;
    } else {
      btnName = buttons[i % buttons.length];
      btnNum = i % buttons.length;
    }

    if (theColor.length < i+1) {
      theColor.add(Colors.white);
      if (btnNum == 0) {
        Do.add(i);
      } else if (btnNum == 1) {
        Ri.add(i);
      } else if (btnNum == 2) {
        Mi.add(i);
      } else if (btnNum == 3) {
        Fa.add(i);
      } else if (btnNum == 4) {
        Sol.add(i);
      } else if (btnNum == 5) {
        La.add(i);
      } else if (btnNum == 6) {
        Si.add(i);
      }
    }
    return
        Container(
          decoration: BoxDecoration(color: theColor[i], border: Border(top: BorderSide(color: Colors.black), left: BorderSide(color: Colors.black), right: BorderSide(color: Colors.black), bottom: BorderSide(color: Colors.black))),
          width: 50,
          height: 200,
          child: Center(child: Text(btnName, style: TextStyle(color: Colors.black),)),
        );

  }
  void click(int i) {
    setState(() {
      theColor[i] = Colors.grey;
    });
  }

  void unClick(int i) {
    setState(() {
      theColor[i] = Colors.white;
    });
  }

  int getNearest(int i) {
    int nearest = 0;
    if (i == 0) nearest = Do[((Do.length-1)/2).floor()];
    else if (i == 1) nearest = Ri[((Ri.length-1)/2).floor()];
    else if (i == 2) nearest = Mi[((Mi.length-1)/2).floor()];
    else if (i == 3) nearest = Fa[((Fa.length-1)/2).floor()];
    else if (i == 4) nearest = Sol[((Sol.length-1)/2).floor()];
    else if (i == 5) nearest = La[((La.length-1)/2).floor()];
    else if (i == 6) nearest = Si[((Si.length-1)/2).floor()];
    return nearest;
  }
  void clickNearest(int i) {
    int nearest = getNearest(i);
    click(nearest);
    Future.delayed(const Duration(milliseconds: 100), () {
      unClick(nearest);
    });
  }
  void play () {
    where = 0;
    playNext();
  }
  void playNext() {
    clickNearest(happyBirthday[where]);
    where++;
    Future.delayed(const Duration(milliseconds: 500), () {
      if (where < happyBirthday.length) {
        playNext();
      }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Text("Happy Birthday", style: TextStyle(fontSize: 30)),
            IconButton(onPressed: play, icon: Icon(Icons.play_arrow)),
            Spacer(),
        Center(
          child:
            Column(
              children: <Widget> [
                Row(
                    children: <Widget> [
                      for (var i=0;i<(MediaQuery.of(context).size.width/50).floor();i++) addPiano(i),
                      ]
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
