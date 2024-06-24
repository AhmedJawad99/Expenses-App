import 'package:app01/widgets/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

var myColorSchme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(225, 59, 96, 179));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expenses App',
      theme: ThemeData().copyWith(
          //useMaterial3: true,
          colorScheme: myColorSchme,
          appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: myColorSchme.onPrimaryContainer,
              foregroundColor: myColorSchme.primaryContainer),
          cardTheme: const CardTheme().copyWith(
            color: myColorSchme.secondaryContainer,
            margin: EdgeInsets.all(8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: myColorSchme.primaryContainer),
          ),
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: myColorSchme.onSecondaryContainer,
                  fontSize: 19))),
      home: const Expenses(),
    );
  }
}
