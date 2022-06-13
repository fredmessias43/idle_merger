class OpenmojiEmoji {
  String emoji;
  String hexcode;
  String group;
  String subgroups;
  String annotation;
  String tags;
  String openmojiTags;
  String openmojiAuthor;
  String openmojiDate;
  String skintone;
  String skintoneCombination;
  String skintoneBaseEmoji;
  String skintoneBaseHexcode;
  String unicode;
  String order;

  OpenmojiEmoji(
      {required this.emoji,
      required this.hexcode,
      required this.group,
      required this.subgroups,
      required this.annotation,
      required this.tags,
      required this.openmojiTags,
      required this.openmojiAuthor,
      required this.openmojiDate,
      required this.skintone,
      required this.skintoneCombination,
      required this.skintoneBaseEmoji,
      required this.skintoneBaseHexcode,
      required this.unicode,
      required this.order});

  OpenmojiEmoji.fromJson(Map<String, dynamic> json)
      : emoji = json['emoji'].toString(),
        hexcode = json['hexcode'].toString(),
        group = json['group'].toString(),
        subgroups = json['subgroups'].toString(),
        annotation = json['annotation'].toString(),
        tags = json['tags'].toString(),
        openmojiTags = json['openmoji_tags'].toString(),
        openmojiAuthor = json['openmoji_author'].toString(),
        openmojiDate = json['openmoji_date'].toString(),
        skintone = json['skintone'].toString(),
        skintoneCombination = json['skintone_combination'].toString(),
        skintoneBaseEmoji = json['skintone_base_emoji'].toString(),
        skintoneBaseHexcode = json['skintone_base_hexcode'].toString(),
        unicode = json['unicode'].toString(),
        order = json['order'].toString();

  Map<String, dynamic> toJson() => {
        'emoji': emoji,
        'hexcode': hexcode,
        'group': group,
        'subgroups': subgroups,
        'annotation': annotation,
        'tags': tags,
        'openmoji_tags': openmojiTags,
        'openmoji_author': openmojiAuthor,
        'openmoji_date': openmojiDate,
        'skintone': skintone,
        'skintone_combination': skintoneCombination,
        'skintone_base_emoji': skintoneBaseEmoji,
        'skintone_base_hexcode': skintoneBaseHexcode,
        'unicode': unicode,
        'order': order
      };
}
