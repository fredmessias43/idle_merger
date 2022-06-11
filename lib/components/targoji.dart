import 'package:flutter/widgets.dart';
import 'package:idle_merger/components/dragoji.dart';
import 'package:idle_merger/models/emoji.dart';

class Targoji extends StatefulWidget {
  const Targoji({Key? key, required this.data, this.initialIndex = 0})
      : super(key: key);

  final List<Emoji> data;
  final int initialIndex;

  @override
  State<Targoji> createState() => _TargojiState();
}

class _TargojiState extends State<Targoji> {
  late int currentIndex;
  late Emoji emoji;

  @override
  void initState() {
    setState(() {
      currentIndex = widget.initialIndex;
      emoji = widget.data[currentIndex];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget(
      builder: (context, list, anotherList) {
        return Dragoji(index: currentIndex, emoji: emoji);
      },
      onAccept: (obj) {
        //debugPrint(emoji.hexcode + ' == ' + obj.toString());
        String item = obj.toString();
        if (emoji.hexcode == item) {
          currentIndex += 1;
          emoji = widget.data[currentIndex];
        }
      },
    );
  }
}
