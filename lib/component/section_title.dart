import 'package:cashier_app_ui/config/preferences.dart';
import 'package:cashier_app_ui/config/theme.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final Color color;
  const SectionTitle(
      {super.key, required this.title, this.color = DColors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: DMargin.defaultMargin, vertical: 12),
      child: Row(
        children: [
          Text(
            title,
            style: DTextStyle.setStyle(
                size: DTextSizes.large,
                fontWeight: DFontWeight.semiBold,
                color: color),
          ),
        ],
      ),
    );
  }
}

class SectionTitleWithExpand extends StatelessWidget {
  final String sectionTitle;
  final String expandTitle;
  final VoidCallback? onPressed;
  const SectionTitleWithExpand(
      {super.key,
      required this.sectionTitle,
      required this.expandTitle,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SectionTitle(title: sectionTitle),
        Container(
            margin: const EdgeInsets.symmetric(
                horizontal: DMargin.defaultMargin, vertical: 12),
            child: TextButton(
                onPressed: onPressed,
                child: Text(
                  expandTitle,
                  style: DTextStyle.setStyle(
                      size: DTextSizes.small,
                      fontWeight: DFontWeight.reguler,
                      color: DColors.darkerBlack),
                )))
      ],
    );
  }
}
