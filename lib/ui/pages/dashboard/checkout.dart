import 'package:cashier_app_ui/config/preferences.dart';
import 'package:cashier_app_ui/screens/ui/carts/summary.dart';
import 'package:flutter/material.dart';

class CheckOutPage extends StatelessWidget {
  final String barcode;
  const CheckOutPage({super.key, this.barcode = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.all(DMargin.defaultMargin),
      // child: CartSummary(
      //   barcode: barcode,
      // )
    );
  }
}
