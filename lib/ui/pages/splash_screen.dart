import 'dart:async';
import 'package:cashier_app_ui/config/theme.dart';
import 'package:cashier_app_ui/helpers/route_helper.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      navigateToNamed(context, 'onboarding');
    });
  }
  // String _barcode = "";
  // Future _scanBarcode() async {
  //   try {
  //     var result = await BarcodeScanner.scan();
  //     setState(() {
  //       _barcode = result.rawContent;
  //     });
  //   } catch (e) {
  //     setState(() {
  //       _barcode = 'Failed to get barcode: $e';
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DColors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 92,
              height: 92,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/logo.png'))),
            ),
            Text(
              'C O N G',
              style: DTextStyle.setStyle(
                  size: DTextSizes.extraLarge,
                  color: Colors.white,
                  fontWeight: DFontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
