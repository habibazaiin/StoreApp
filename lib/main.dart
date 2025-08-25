import 'package:flutter/material.dart';
import 'package:my_app/screens/add_product_page.dart';
import 'package:my_app/screens/home_page.dart';
import 'package:my_app/screens/update_product_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdateProductPage.id: (context) => UpdateProductPage(),
        AddProductPage.id: (context) => AddProductPage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
