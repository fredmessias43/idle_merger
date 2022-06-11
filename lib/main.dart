import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idle_merger/components/targoji.dart';
import 'package:idle_merger/models/emoji.dart';

void main() {
  runApp(const IdleApp());
}

class IdleApp extends StatelessWidget {
  const IdleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Idle Merger',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var emojiData = <Emoji>[];

  void readData() async {
    var response = await rootBundle.loadString("assets/data/openmoji.json");
    var json = (jsonDecode(response) as List<dynamic>);

    setState(() {
      emojiData = json.map<Emoji>((e) {
        return Emoji.fromJson(e);
      }).toList();
    });
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: emojiData.isEmpty
              ? const Text('Vazio')
              : Column(
                  children: [
                    Targoji(data: emojiData),
                    Targoji(data: emojiData),
                  ],
                )),
    );
  }
}
