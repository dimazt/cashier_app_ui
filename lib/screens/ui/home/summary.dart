import 'package:cashier_app_ui/config/theme.dart';
import 'package:flutter/material.dart';

class HomeSummaryCard extends StatelessWidget {
  const HomeSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      width: double.infinity,
      height: 152,
      decoration: BoxDecoration(
          color: DBackground.blue,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/image/bg_c_effect.png'))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Penjualan Hari ini',
              style: DTextStyle.setStyle(
                  size: DTextSizes.normal,
                  fontWeight: DFontWeight.reguler,
                  color: Colors.white),
            ),
          ),
          Center(
            child: Text(
              'Rp 13.000',
              style: DTextStyle.setStyle(
                  size: DTextSizes.extraLarge,
                  fontWeight: DFontWeight.bold,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
