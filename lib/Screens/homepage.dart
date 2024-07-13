import 'package:converter/Screens/audiototext.dart';
import 'package:converter/Screens/texttoaudio.dart';
import 'package:converter/utils/contants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomePageState();
}

class _HomePageState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaycolor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Speechtotext(),
                    ));
              },
              child: Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [maincolor, Colors.black],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: CupertinoColors.lightBackgroundGray,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      'Speech',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: secondaycolor),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      CupertinoIcons.arrow_right,
                      size: 40,
                      color: Colors.white54,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Text',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: secondaycolor),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Texttospeech(),
                    ));
              },
              child: Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [maincolor, Colors.black],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: CupertinoColors.lightBackgroundGray,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      'Text',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: secondaycolor),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      CupertinoIcons.arrow_right,
                      size: 40,
                      color: Colors.white54,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Speech',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: secondaycolor),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
