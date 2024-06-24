import 'package:app01/widgets/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

var myColorSchme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(225, 59, 96, 179));
var myDarkColorScheme =
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
      themeMode: ThemeMode.light,
      theme: ThemeData().copyWith(
          //useMaterial3: true,
          colorScheme: myColorSchme,
          appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: myColorSchme.onPrimaryContainer,
              foregroundColor: myColorSchme.primaryContainer),
          cardTheme: const CardTheme().copyWith(
            color: myColorSchme.secondaryContainer,
            margin: const EdgeInsets.all(8),
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
      darkTheme: ThemeData.dark().copyWith(
          //useMaterial3: true,
          colorScheme: myDarkColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: myDarkColorScheme.onPrimaryContainer,
              foregroundColor: myDarkColorScheme.primaryContainer),
          cardTheme: const CardTheme().copyWith(
            color: myDarkColorScheme.secondaryContainer,
            margin: const EdgeInsets.all(8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: myDarkColorScheme.onPrimaryContainer,
                foregroundColor: myDarkColorScheme.primaryContainer),
          ),
          iconTheme: const IconThemeData()
              .copyWith(color: myDarkColorScheme.onPrimaryContainer),
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: myDarkColorScheme.onSecondaryContainer,
                  fontSize: 19))),
      home: const Expenses(),
    );
  }
}
