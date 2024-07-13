import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../utils/contants.dart';

class Texttospeech extends StatefulWidget {
  const Texttospeech({super.key});

  @override
  State<Texttospeech> createState() => _TexttospeechState();
}

class _TexttospeechState extends State<Texttospeech> {
  FlutterTts flutterTts = FlutterTts();

  TextEditingController _textcontroller = TextEditingController();
  List<Map> voices = [];
  Map? currentvoice;

  @override
  void initState() {
    super.initState();
    initTts();
  }

  void initTts() {
    flutterTts.getVoices.then((data) {
      try {
        voices = List<Map>.from(data);
        setState(() {
          voices =
              voices.where((voices) => voices['name'].contains('en')).toList();

          currentvoice == voices.first;
          setvoice(currentvoice!);
        });
      } catch (e) {
        print(e);
      }
    });
  }

  void setvoice(Map voice) {
    flutterTts.setVoice({'name': voice['name'], 'locale': voice['locale']});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaycolor,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [maincolor, Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Row(
          children: [
            Text(
              'Text',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: secondaycolor),
            ),
            const SizedBox(
              width: 30,
            ),
            const Icon(
              CupertinoIcons.arrow_right,
              size: 40,
              color: Colors.white54,
            ),
            const SizedBox(
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              maxLines: 6,
              controller: _textcontroller,
              decoration: InputDecoration(
                  labelText: 'Type here a message.........',
                  labelStyle: TextStyle(color: maincolor),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: maincolor))),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: maincolor),
                    onPressed: () {
                      flutterTts.speak(_textcontroller.text);
                    },
                    child: Icon(
                      CupertinoIcons.speaker_2,
                      color: Colors.white,
                      size: 30,
                    )),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade200),
                    onPressed: () {
                      _textcontroller.clear();
                      setState(() {});
                    },
                    child: Text(
                      'Clear',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
