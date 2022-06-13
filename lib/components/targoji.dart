import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:idle_merger/components/dragoji.dart';
import 'package:idle_merger/models/emoji.dart';

class Targoji extends StatefulWidget {
  const Targoji(
      {Key? key,
      this.initialIndex = 0,
      required this.onMerge,
      required this.emoji})
      : super(key: key);

  final int initialIndex;
  final Emoji emoji;
  final void Function(Emoji outsideEmoji, int index) onMerge;

  @override
  State<Targoji> createState() => _TargojiState();
}

class _TargojiState extends State<Targoji> {
  late int currentIndex;

  @override
  void initState() {
    setState(() {
      currentIndex = widget.initialIndex;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget(
      builder: (context, list, anotherList) {
        return Dragoji(index: currentIndex, emoji: widget.emoji);
      },
      onAccept: (Emoji outsideEmoji) {
        // debugPrint(emoji.hexcode + ' == ' + item);
        if (widget.emoji.hexcode == outsideEmoji.hexcode &&
            widget.emoji.id != outsideEmoji.id) {
          setState(() {
            currentIndex += 1;
            widget.onMerge(outsideEmoji, currentIndex);
          });
        }
      },
    );
  }
}
