import 'package:flutter/widgets.dart';
import 'package:idle_merger/components/dragoji.dart';
import 'package:idle_merger/models/emoji.dart';

class Targoji extends StatelessWidget {
  const Targoji({Key? key, required this.onMerge, required this.emoji})
      : super(key: key);

  final Emoji emoji;
  final void Function(Emoji outsideEmoji) onMerge;

  @override
  Widget build(BuildContext context) {
    return DragTarget<Emoji>(
      builder: (context, list, anotherList) {
        return Dragoji(emoji: emoji);
      },
      onWillAccept: (outsideEmoji) {
        return emoji.hexcode == outsideEmoji?.hexcode &&
            emoji.id != outsideEmoji?.id;
      },
      onAccept: (outsideEmoji) {
        onMerge(outsideEmoji);
      },
    );
  }
}
