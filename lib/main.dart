import 'package:cashier_app_ui/config/theme.dart';
import 'package:cashier_app_ui/ui/pages/dashboard/dashboard.dart';
import 'package:cashier_app_ui/screens/page/splash_screen.dart';
import 'package:cashier_app_ui/screens/ui/carts/summary.dart';
import 'package:cashier_app_ui/ui/pages/onboarding_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: DBackground.lightGrey),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnBoardingPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/cart-summary': (context) => const CartSummary()
      },
    );
  }
}
