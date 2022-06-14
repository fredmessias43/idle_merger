import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:idle_merger/models/emoji.dart';

class Dragoji extends StatelessWidget {
  const Dragoji({Key? key, required this.emoji}) : super(key: key);

  final Emoji emoji;

  Widget createEmoji() {
    return Column(
      children: [
        SvgPicture.asset('assets/emojis/${emoji.hexcode}.svg'),
        //Text('${emoji.index}'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: emoji,
      feedback: createEmoji(),
      child: createEmoji(),
      childWhenDragging: Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(
            border: Border.all(style: BorderStyle.solid, color: Colors.black)),
      ),
    );
  }
}
