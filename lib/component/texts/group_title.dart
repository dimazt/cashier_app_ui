import 'package:cashier_app_ui/config/theme.dart';
import 'package:flutter/material.dart';

class GroupedTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool reverse;

  const GroupedTitle(
      {super.key,
      required this.title,
      required this.subtitle,
      this.reverse = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildConditionalGroup()),
    );
  }

  _buildConditionalGroup() {
    if (reverse) {
      return [Subtitle(subtitle: subtitle), DTitle(title: title)];
    }
    return [DTitle(title: title), Subtitle(subtitle: subtitle)];
  }
}

class Subtitle extends StatelessWidget {
  final String subtitle;
  const Subtitle({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: DTextStyle.setStyle(
        size: DTextSizes.extraSmall,
        fontWeight: DFontWeight.reguler,
        color: DColors.darkerBlack,
      ),
    );
  }
}

class DTitle extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  const DTitle(
      {super.key,
      required this.title,
      this.color = DColors.black,
      this.fontWeight = DFontWeight.medium,
      this.fontSize = DTextSizes.normal});
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: DTextStyle.setStyle(
        size: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
