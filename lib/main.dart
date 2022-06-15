import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idle_merger/components/targoji.dart';
import 'package:idle_merger/models/emoji.dart';
import 'package:idle_merger/models/openmoji_emoji.dart';
import 'package:idle_merger/utils/window_size.dart';

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
  var emojiData = <OpenmojiEmoji>[];

  Future readData() async {
    var response = await rootBundle.loadString("assets/data/openmoji.json");
    var json = (jsonDecode(response) as List<dynamic>);

    setState(() {
      emojiData = json.map<OpenmojiEmoji>((e) {
        return OpenmojiEmoji.fromJson(e);
      }).toList();
    });
  }

  @override
  void initState() {
    readData().then((value) {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        fillLists();
      });
    });

    super.initState();
  }

  var rng = Random();

  var list = <Emoji>[];
  var positionsList = <Map<String, double>>[];

  void fillLists({maxItems = 10}) {
    if (list.length >= maxItems) {
      return;
    }

    setState(() {
      list.add(Emoji.fromParent(emojiData[0]));
    });
  }

  Widget renderEmoji(Emoji emoji) {
    return Positioned(
      left: emoji.x,
      top: emoji.y,
      child: Targoji(
        // initialIndex: 9,
        key: Key(emoji.id),
        emoji: emoji,
        onMerge: (outsideEmoji) => onMerge(emoji, outsideEmoji),
      ),
    );
  }

  void onMerge(currentEmoji, outsideEmoji) {
    int outsideEmojiIdx = list.indexWhere((item) => item.id == outsideEmoji.id);
    // debugPrint('$outsideEmojiIdx - ${outsideEmoji.id}');
    if (outsideEmojiIdx > -1) {
      setState(() {
        list.removeAt(outsideEmojiIdx);
      });
    }

    int currentEmojiIdx = list.indexWhere((item) => item.id == currentEmoji.id);
    // debugPrint('$currentEmojiIdx - ${currentEmoji.id}');
    if (currentEmojiIdx > -1) {
      Emoji newEmoji = list[currentEmojiIdx];
      newEmoji.index = newEmoji.index + 1;
      newEmoji = newEmoji.copyFromParent(emojiData[newEmoji.index]);

      setState(() {
        list[currentEmojiIdx] = newEmoji;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      // appBar: AppBar(),
      body: SizedBox(
        height: height,
        width: width,
        child: emojiData.isEmpty
            ? const Text('Carregando...')
            : DragTarget<Emoji>(
                builder: (context, candidateData, rejectedData) {
                  return Stack(
                    children: list.map((e) => renderEmoji(e)).toList(),
                  );
                },
                onAcceptWithDetails: (details) {
                  var emoji = details.data;
                  var offset = details.offset;

                  var idx = list.indexWhere((em) => em.id == emoji.id);

                  setState(() {
                    list[idx].x = offset.dx;
                    list[idx].y = offset.dy;
                  });
                },
              ),
      ),
    );
  }
}
