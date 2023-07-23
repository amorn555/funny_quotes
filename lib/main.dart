import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int ndifQuote = 0;
  int ndiffColor = 0;

  static const List<String> quotesList = [
    'เป็นคนไม่ค่อยฝัน เพราะว่าฉันไม่ค่อยนอน',
    'รอคนไม่มีหัวใจ ก็เหมือนรอประชาธิปไตยจากรัฐบาล',
    'คนที่ทำให้เราหลง คือคนที่ส่งโลเคชั่นผิด',
    'คนที่คิดไปไกล สุดท้ายก็ต้องเติมน้ำมัน',
    'Google ที่ว่าแน่ ยัง Search หาคู่แท้ไม่เจอเลย',
  ];
  static const List<Color> colorList = [Colors.green, Colors.blue, Colors.red];

  var quote = quotesList[0];
  var colors = colorList[0];

  void handleClickGo() {
    setState(() {
      var rand = Random();
      var rand2 = Random();
      var randQuote = 0;
      var randColor = 0;
      while (true) {
        randQuote = rand.nextInt(quotesList.length);
        if (randQuote != ndifQuote) {
          break;
        }
      }
      while (true) {
        randColor = rand2.nextInt(colorList.length);
        if (randColor != ndiffColor) {
          break;
        }
      }
      quote = quotesList[randQuote];
      ndifQuote = randQuote;
      colors = colorList[randColor];
      ndiffColor = randColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('คำคม')),
      floatingActionButton: FloatingActionButton(
        child: const Text('GO'),
        onPressed: handleClickGo,
      ),
      body: Center(
        child: Text(
          quote,
          style: TextStyle(
              color: colors,
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}