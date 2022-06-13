import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:idle_merger/models/emoji.dart';

class Dragoji extends StatelessWidget {
  const Dragoji({Key? key, required this.index, required this.emoji})
      : super(key: key);

  final int index;
  final Emoji emoji;

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: emoji,
      feedback: Text(emoji.hexcode),
      child: Container(
        width: 75,
        child: Column(
          children: [
            SvgPicture.asset('assets/emojis/${emoji.hexcode}.svg'),
            Text(emoji.annotation),
          ],
        ),
      ),
    );
  }
}
