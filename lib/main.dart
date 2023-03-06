import 'package:flutter/material.dart';
import 'package:mostrandskills/vistas/home_page.dart';
import 'package:mostrandskills/vistas/wallet_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WalletPage(title: 'Flutter Demo Home Page'),
    );
  }
}
