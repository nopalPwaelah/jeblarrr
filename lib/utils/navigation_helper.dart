import 'package:flutter/material.dart';
import '../pages/about_page.dart';
import '../pages/contact_page.dart';
import '../pages/menu_page.dart';
import '../pages/order_page.dart';
import '../pages/promotion_page.dart';

void navigateToSection(BuildContext context, String section, {String? currentPage}) {
  if (currentPage != null && currentPage == section) {
    return;
  }

  switch (section) {
    case 'home':
      Navigator.popUntil(context, (route) => route.isFirst);
      break;
    case 'about':
      Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutPage()));
      break;
    case 'promotion':
      Navigator.push(context, MaterialPageRoute(builder: (_) => const PromotionPage()));
      break;
    case 'products':
      Navigator.push(context, MaterialPageRoute(builder: (_) => const MenuPage()));
      break;
    case 'order':
      Navigator.push(context, MaterialPageRoute(builder: (_) => const OrderPage()));
      break;
    case 'contact':
      Navigator.push(context, MaterialPageRoute(builder: (_) => const ContactPage()));
      break;
    default:
      break;
  }
}
