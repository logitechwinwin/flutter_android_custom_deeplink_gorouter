import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_recognition_result.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  stt.SpeechToText speech = stt.SpeechToText();
  bool isListening = false;
  bool speechEnabled = false;
  String lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    speechEnabled = await speech.initialize();
    setState(() {});
  }

  void _startListening() async {
    print("object");
    if (isListening) {
      _stopListening();
      setState(() {
        isListening = false;
        lastWords = '';
        print('Listening stopped');
      });
      return;
    }
    speech.listen(
      onResult:
          (result) => setState(() {
            lastWords = result.recognizedWords;
            print('Last words: $lastWords');
            if (result.finalResult) {
              print('Final result: $lastWords');
              if (lastWords.contains("second")) {
                context.go('/second');
              } else if (lastWords.contains("home")) {
                context.go('/');
              } else {
                print('No matching route found');
              }
            }
          }),
    );
    setState(() {
      isListening = true;
    });
  }

  void _stopListening() async {
    await speech.stop();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Home Page"),
            ElevatedButton(
              onPressed: () {
                context.go('/second');
              },
              child: Text('Go to Second Page'),
            ),
            ElevatedButton(
              onPressed: _startListening,
              child: Text('start listening'),
            ),
          ],
        ),
      ),
    );
  }
}
