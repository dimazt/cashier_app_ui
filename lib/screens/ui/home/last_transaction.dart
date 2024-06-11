import 'package:cashier_app_ui/component/buttons/icon_button.dart';
import 'package:cashier_app_ui/component/texts/group_title.dart';
import 'package:cashier_app_ui/config/preferences.dart';
import 'package:cashier_app_ui/config/theme.dart';
import 'package:flutter/material.dart';

class HomeLastTransaction extends StatelessWidget {
  const HomeLastTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: DMargin.defaultMargin),
      padding: const EdgeInsets.all(DPadding.defaultPadding),
      width: double.infinity,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
          color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: data.map((item) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            child: Row(
              children: [
                ActionIconButton(
                  icon: item['icon'],
                  iconSize: 24,
                  cardSize: 48,
                  radius: 48,
                  cardColor: item['cardColor'] as Color,
                ),
                GroupedTitle(
                  title: item['title'],
                  subtitle: item['subtitle'],
                ),
                const Spacer(),
                DTitle(
                  title: item['amount'],
                  color: item['amountColor'],
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

final List<Map<String, dynamic>> data = [
  {
    'icon': Icons.abc,
    'title': 'Netflix',
    'subtitle': '5 Feb',
    'amount': '- Rp 40.000.000',
    'amountColor': Colors.red,
    'cardColor': DColors.green,
  },
  {
    'icon': Icons.abc,
    'title': 'Spotify',
    'subtitle': '3 Feb',
    'amount': '- Rp 50.000',
    'amountColor': Colors.red,
    'cardColor': Colors.red,
  },
];
