import 'dart:math';

import 'package:idle_merger/models/openmoji_emoji.dart';
import 'package:idle_merger/utils/window_size.dart';
import 'package:uuid/uuid.dart';

class Emoji extends OpenmojiEmoji {
  String id = const Uuid().v4();

  double x;
  double y;

  Emoji(
      {required this.x,
      required this.y,
      required String emoji,
      required String hexcode,
      required String group,
      required String subgroups,
      required String annotation,
      required String tags,
      required String openmojiTags,
      required String openmojiAuthor,
      required String openmojiDate,
      required String skintone,
      required String skintoneCombination,
      required String skintoneBaseEmoji,
      required String skintoneBaseHexcode,
      required String unicode,
      required String order})
      : super(
            emoji: emoji,
            hexcode: hexcode,
            group: group,
            subgroups: subgroups,
            annotation: annotation,
            tags: tags,
            openmojiTags: openmojiTags,
            openmojiAuthor: openmojiAuthor,
            openmojiDate: openmojiDate,
            skintone: skintone,
            skintoneCombination: skintoneCombination,
            skintoneBaseEmoji: skintoneBaseEmoji,
            skintoneBaseHexcode: skintoneBaseHexcode,
            unicode: unicode,
            order: order);

  static Emoji fromParent(OpenmojiEmoji parent) {
    double x = _generateX();
    double y = _generateY();
    return Emoji(
        x: x,
        y: y,
        emoji: parent.emoji,
        hexcode: parent.hexcode,
        group: parent.group,
        subgroups: parent.subgroups,
        annotation: parent.annotation,
        tags: parent.tags,
        openmojiTags: parent.openmojiTags,
        openmojiAuthor: parent.openmojiAuthor,
        openmojiDate: parent.openmojiDate,
        skintone: parent.skintone,
        skintoneCombination: parent.skintoneCombination,
        skintoneBaseEmoji: parent.skintoneBaseEmoji,
        skintoneBaseHexcode: parent.skintoneBaseHexcode,
        unicode: parent.unicode,
        order: parent.order);
  }

  Emoji copyFromParent(OpenmojiEmoji parent) {
    emoji = parent.emoji;
    hexcode = parent.hexcode;
    group = parent.group;
    subgroups = parent.subgroups;
    annotation = parent.annotation;
    tags = parent.tags;
    openmojiTags = parent.openmojiTags;
    openmojiAuthor = parent.openmojiAuthor;
    openmojiDate = parent.openmojiDate;
    skintone = parent.skintone;
    skintoneCombination = parent.skintoneCombination;
    skintoneBaseEmoji = parent.skintoneBaseEmoji;
    skintoneBaseHexcode = parent.skintoneBaseHexcode;
    unicode = parent.unicode;
    order = parent.order;

    return this;
  }

  static double _generateX() {
    var width = WindowSize.logicalWidth;
    return Random().nextInt(width.ceil() - 75).toDouble();
  }

  static double _generateY() {
    var height = WindowSize.logicalHeight;
    return Random().nextInt(height.ceil() - 75).toDouble();
  }
}
