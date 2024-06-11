import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:cashier_app_ui/config/theme.dart';
import 'package:cashier_app_ui/screens/ui/carts/summary.dart';
import 'package:flutter/material.dart';

class DashboardScanBarcodes extends StatefulWidget {
  final Function(String) onBarcodeScanned;

  const DashboardScanBarcodes({super.key, required this.onBarcodeScanned});

  @override
  State<DashboardScanBarcodes> createState() => _DashboardScanBarcodesState();
}

class _DashboardScanBarcodesState extends State<DashboardScanBarcodes> {
  Future _scanBarcode() async {
    try {
      var result = await BarcodeScanner.scan();
      if (result.rawContent.isNotEmpty) {
        widget.onBarcodeScanned(
            result.rawContent); // Trigger navigation to CartScreen with barcode
      }
    } catch (e) {
      // Handle error if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _showBottomSheet(context),
      backgroundColor: DColors.blue,
      shape: const CircleBorder(),
      child: const Icon(
        Icons.shopping_cart,
        color: Colors.white,
        size: 28,
      ),
    );
  }
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
          child: CartSummary(
            barcode: 'aasasa',
          ));
    },
  );
}
