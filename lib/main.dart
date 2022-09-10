import 'package:flutter/material.dart';
import 'package:test_lab/screens/about_company.dart';
import 'package:test_lab/screens/equipment_catalog.dart';
import 'package:test_lab/screens/service_page.dart';
import 'package:test_lab/utils/pages.dart';
import 'package:test_lab/utils/theme.dart';
import 'package:test_lab/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme(),
      home: const HomePage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case homePage:
            return MaterialPageRoute(builder: (context) => const HomePage());
          case aboutCompanyPage:
            return MaterialPageRoute(
                builder: (context) => const AboutCompanyPage());
          case catalogPage:
            return MaterialPageRoute(builder: (context) => CatalogPage());
          case servicePage:
            return MaterialPageRoute(builder: (context) => ServicePage());
        }
      },
    );
  }
}
