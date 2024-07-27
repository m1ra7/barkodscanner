import 'package:barkodscanner/TabViewStyle.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bar&QR Scanner',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueGrey[900],
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
        appBarTheme: AppBarTheme(color: Colors.blueGrey[900]),
        tabBarTheme: TabBarTheme(),
        primaryColor: Colors.blueGrey[900],
        bottomAppBarTheme: BottomAppBarTheme.of(context).copyWith(color: Colors.blueGrey[100]),
      ),
      home: Scaffold(body: TabViewStyle()),
    );
  }
}

