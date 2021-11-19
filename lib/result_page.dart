import 'package:flutter/material.dart';
import 'package:tomodachi/main.dart';
import 'package:share_plus/share_plus.dart';

// ignore: must_be_immutable
class ResultPage extends StatefulWidget {
  String question = '';
  String answer = '';

  ResultPage({Key? key, required this.question, required this.answer})
      : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  void share(BuildContext context, String question, String answer) {
    RenderBox? box = context.findRenderObject() as RenderBox;

    String msg = 'Q: $question?\nA: $answer';
    Share.share(msg,
        subject: 'และนี่ก็คือ! คำตอบที่พวกนายต้องการยังไงล่ะ!!!',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Q: ${widget.question}?',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 5),
              Text(
                'A: ${widget.answer}',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 30),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const MyApp()));
                  },
                  child: const Text('Go back', style: TextStyle(fontSize: 22)),
                  style: TextButton.styleFrom(
                      fixedSize: const Size(150, 50),
                      primary: Colors.white,
                      backgroundColor: Colors.green.shade300)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          share(context, widget.question, widget.answer);
        },
        child: const Icon(Icons.share_rounded, size: 35),
      ),
    );
  }
}
