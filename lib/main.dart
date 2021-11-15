import 'package:flutter/material.dart';
import 'package:tomodachi/result_page.dart';
import 'package:tomodachi/answer.dart';
import "dart:math";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ask your Tomodachi',
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
      ),
      home: const MyHomePage(title: 'Ask your Tomodachi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController qFieldController = TextEditingController();

  final _random = Random();
  String answer = '';
  String question = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'คงจะคิดอะไรไม่ออกอยู่สินะ',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 5),
            const Text(
              'ลองมาถามฉันดูสิ',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 30),
            TextField(
                controller: qFieldController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'อยากถามอะไรก็ว่ามาเลย...')),
            const SizedBox(height: 30),
            TextButton(
                onPressed: () {
                  answer = answerList[_random.nextInt(answerList.length)];
                  question = qFieldController.text;

                  if (qFieldController.text.isEmpty) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: const Text('Warning'),
                              content: const Text(
                                  'กรุณากรอกคำถามก่อนจะให้ช่วยตัดสินใจ'),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('ok')),
                              ]);
                        });
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ResultPage(question: question, answer: answer)));
                  }
                },
                child: const Text('Get the answer',
                    style: TextStyle(fontSize: 22)),
                style: TextButton.styleFrom(
                    fixedSize: const Size(200, 50),
                    primary: Colors.white,
                    backgroundColor: Colors.green.shade300)),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Help'),
                    content: const Text(
                        '''Ask your tomodachi เว็บแอปที่ถูกสร้างขึ้นมาเพื่อคนที่ต้องการให้ช่วย
ตัดสินใจเรื่องต่างๆ ที่ไม่รู้ว่าจะเอายังไงกับมันดี แต่ก็ไม่มีใครให้ปรึกษา
ก็สามารถมาปรึกษากับเราได้ แล้วเดี๋ยวคำตอบที่ได้มาก็จะเป็นทางออกให้กับพวกนายเอง
                        
(เว็ปแอปตัวนี้ได้รับแรงบันดาลใจมาจากหนังสือ "เพื่อนแท้" ของ Bearhug)'''),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: const Text('Credits'),
                                      content: const Text(
                                          'Developer: Jirayu Kaewsing'),
                                      actions: <Widget>[
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('ok')),
                                      ]);
                                });
                          },
                          child: const Text('credits')),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('ok')),
                    ],
                  );
                });
          },
          child: const Icon(Icons.help_outline_sharp, size: 40)),
    );
  }
}
