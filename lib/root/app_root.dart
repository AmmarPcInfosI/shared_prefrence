import 'package:flutter/material.dart';
import 'package:shared_prefrence/screens/products_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:ProductScreen(),
    );
  }
}