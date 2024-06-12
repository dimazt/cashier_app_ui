import 'package:cashier_app_ui/component/buttons/icon_button.dart';
import 'package:cashier_app_ui/config/preferences.dart';
import 'package:cashier_app_ui/config/theme.dart';
import 'package:flutter/material.dart';

class HomeServices extends StatelessWidget {
  const HomeServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: DMargin.defaultMargin),
      width: double.infinity,
      height: 84,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Jumlah kolom
          crossAxisSpacing: 0.2, // Jarak antar kolom
          mainAxisSpacing: 0.2, // Jarak antar baris
          childAspectRatio: 1, // Rasio aspek anak-anak (1 berarti kotak)
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          final item = _getListItem(context)[index];
          return ActionIconButton(
            title: item['title'] as String,
            icon: item['icon'] as IconData,
            onTap: item['onTap'] as VoidCallback?,
          );
        },
      ),
    );
  }
}

List _getListItem(BuildContext context) {
  return <Map<String, dynamic>>[
    {
      'title': 'Towerlamp',
      'icon': Icons.cell_tower_rounded,
    },
    {'title': 'Dynamo', 'icon': Icons.dynamic_form_rounded},
    {'title': 'Soto', 'icon': Icons.food_bank_rounded},
    {
      'title': 'More',
      'icon': Icons.more_horiz_rounded,
      'onTap': () => _showBottomSheet(context)
    },
  ];
}

_showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: DBackground.lightGrey,
    isScrollControlled:
        true, // Untuk mengaktifkan scroll jika konten tidak muat
    builder: (BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 26),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 100,
              margin: const EdgeInsets.only(bottom: 20),
              child: LinearProgressIndicator(
                minHeight: 5,
                borderRadius: BorderRadius.circular(50),
                value: 1,
                valueColor: const AlwaysStoppedAnimation(DColors.black),
                backgroundColor: DBackground.blue,
              ),
            ),

            const Wrap(
              spacing: 35,
              runSpacing: 20,
              children: [],
            ),

            // Tambahkan widget lain sesuai kebutuhan
          ],
        ),
      );
    },
  );
}
