import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Perform any async initialization work here, such as loading data
  await someAsyncMethod();

  // Now run the app
  runApp(const MyApp());
}

Future<void> someAsyncMethod() async {
  // Simulating some async work
  await Future.delayed(const Duration(seconds: 2));
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}