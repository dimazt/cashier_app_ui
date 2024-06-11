import 'package:flutter/material.dart';

MaterialPageRoute _materialPageRoute(Widget route) {
  return MaterialPageRoute(builder: (context) => route);
}

void navigateTo(BuildContext context, Widget route) {
  Navigator.push(context, _materialPageRoute(route));
}

void navigateToNamed(BuildContext context, String route) {
  Navigator.pushNamed(context, '/$route');
}

void navigateAndReplacedNamed(BuildContext context, String route) {
  Navigator.pushReplacementNamed(context, '/$route');
}

void navigateAndRemoveNamed(BuildContext context, String route) {
  Navigator.pushNamedAndRemoveUntil(context, '/$route', ((route) => false));
}
