import 'package:flutter/material.dart';
import 'package:tomodachi/main.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Result')),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Q: ${widget.question}?',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 5),
              Text(
                'A: ${widget.answer}',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 30),
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => MyApp()));
                  },
                  child: Text('Go back', style: TextStyle(fontSize: 22)),
                  style: TextButton.styleFrom(
                      fixedSize: const Size(150, 50),
                      primary: Colors.white,
                      backgroundColor: Colors.green.shade300)),
            ],
          ),
        )));
  }
}
