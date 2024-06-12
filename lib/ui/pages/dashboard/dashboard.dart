import 'package:cashier_app_ui/screens/ui/dashboard/bottom_navbar.dart';
import 'package:cashier_app_ui/ui/pages/dashboard/floating_barcode_button.dart';
import 'package:cashier_app_ui/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'checkout.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  String _barcode = "";

  void _onBarcodeScanned(String barcode) {
    setState(() {
      _barcode = barcode;
      _selectedIndex = 1; // Navigate to CartScreen
    });
  }

  void _onSelectedItem(int selectedIndex) {
    setState(() {
      _selectedIndex = selectedIndex; // Navigate to selected screen
    });
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 1:
        return CheckOutPage(barcode: _barcode);
      case 2:
      case 3:
        return const Placeholder(); // Use Placeholder for pages that are not implemented yet
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: DashboardBottomNavigationBar(
          currentIndex: _selectedIndex,
          onTapItem: _onSelectedItem,
        ),
        floatingActionButton: DashboardScanBarcodes(
          onBarcodeScanned: _onBarcodeScanned,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: _buildBody());
  }
}
