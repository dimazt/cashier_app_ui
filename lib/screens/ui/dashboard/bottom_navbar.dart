import 'package:cashier_app_ui/config/theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DashboardBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTapItem;
   DashboardBottomNavigationBar(
      {super.key, required this.currentIndex, required this.onTapItem});

  double iconWidth = 20;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      surfaceTintColor: Colors.white,
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      notchMargin: 6,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context)
            .viewInsets
            .bottom, // Menghilangkan padding bawah
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTapItem,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: DColors.blue,
        unselectedItemColor: DColors.black,
        selectedLabelStyle:
            DTextStyle.setStyle(color: DColors.blue, size: DTextSizes.small),
        unselectedLabelStyle:
            DTextStyle.setStyle(color: DColors.black, size: DTextSizes.small),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_repair_service_rounded,
                size: iconWidth,
                color: currentIndex == 0 ? DColors.blue : DColors.black,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.history_rounded,
                size: iconWidth,
                color: currentIndex == 1 ? DColors.blue : DColors.black,
              ),
              label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.sell_rounded,
                size: iconWidth,
                color: currentIndex == 2 ? DColors.blue : DColors.black,
              ),
              label: 'Products'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_rounded,
                size: iconWidth,
                color: currentIndex == 3 ? DColors.blue : DColors.black,
              ),
              label: 'Settings'),
        ],
      ),
    );
  }
}
