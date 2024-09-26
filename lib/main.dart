import 'package:flutter/material.dart';
import 'package:random_quote_simple_mvvm/di/module.dart';
import 'package:random_quote_simple_mvvm/view/random_quote_view.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RandomQuoteView(),
    );
  }
}
