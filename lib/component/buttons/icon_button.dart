import 'package:cashier_app_ui/config/theme.dart';
import 'package:flutter/material.dart';

class ActionIconButton extends StatelessWidget {
  final IconData? icon;
  final String? imageUrl;
  final double? iconSize;
  final double? cardSize;
  final double? radius;
  final VoidCallback? onTap;
  final String? title;
  final Color? cardColor;
  final Color? iconColor;
  const ActionIconButton(
      {super.key,
      this.icon,
      this.imageUrl,
      this.iconSize = 20,
      this.cardSize = 40,
      this.radius = 16,
      this.onTap,
      this.title,
      this.cardColor = DColors.blue,
      this.iconColor = Colors.white})
      : assert((icon != null && imageUrl == null) ||
            (icon == null && imageUrl != null));

  @override
  Widget build(BuildContext context) {
    bool showTitle = title.toString() != 'null' ? true : false;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(4),
            height: cardSize,
            width: cardSize,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(radius!),
                color: cardColor),
            child: Align(alignment: Alignment.center, child: _buildIcon()),
          ),
          if (showTitle)
            Text(
              title.toString(),
              style: DTextStyle.setStyle(
                  size: DTextSizes.extraSmall, fontWeight: DFontWeight.reguler),
              textAlign: TextAlign.center,
            )
        ],
      ),
    );
  }

  Widget _buildIcon() {
    if (icon != null) {
      return Icon(
        icon as IconData,
        size: iconSize,
        color: iconColor,
      );
    }
    return Image.asset(
      icon as String,
      height: iconSize,
      width: iconSize,
      color: iconColor,
    );
  }
}
