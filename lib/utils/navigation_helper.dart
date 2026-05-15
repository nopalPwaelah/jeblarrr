import 'package:flutter/material.dart';

void navigateToSection(BuildContext context, String section, {String? currentPage}) {
  if (currentPage != null && currentPage == section) {
    return;
  }

  final routeMap = {
    'home': '/home',
    'about': '/about',
    'promotion': '/promotion',
    'products': '/products',
    'order': '/order',
    'contact': '/contact',
  };

  final route = routeMap[section];
  if (route != null) {
    Navigator.pushReplacementNamed(context, route);
  }
}
