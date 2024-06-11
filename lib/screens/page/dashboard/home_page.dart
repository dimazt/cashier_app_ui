import 'package:cashier_app_ui/component/section_title.dart';
import 'package:cashier_app_ui/screens/ui/home/last_transaction.dart';
import 'package:cashier_app_ui/screens/ui/home/profile.dart';
import 'package:cashier_app_ui/screens/ui/home/services.dart';
import 'package:cashier_app_ui/screens/ui/home/summary.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const HomeProfile(),
        const HomeSummaryCard(),
        const SectionTitle(title: 'Services'),
        const HomeServices(),
        SectionTitleWithExpand(
          sectionTitle: 'Last Transaction',
          expandTitle: 'View all',
          onPressed: () => {},
        ),
        const HomeLastTransaction()
      ],
    );
  }
}
