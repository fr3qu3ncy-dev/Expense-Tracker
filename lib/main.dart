import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
var kDarkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 5, 99, 125),
    brightness: Brightness.dark);

ThemeData _generateTheme(ThemeData copyFrom, ColorScheme colorScheme) {
  return copyFrom.copyWith(
    useMaterial3: true,
    colorScheme: colorScheme,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: colorScheme.primaryContainer,
      foregroundColor: colorScheme.onPrimaryContainer,
    ),
    cardTheme: const CardTheme().copyWith(
      color: colorScheme.secondaryContainer,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
      ),
    ),
    textTheme: copyFrom.textTheme.copyWith(
      titleLarge: GoogleFonts.raleway(
        textStyle: TextStyle(
          color: colorScheme.onSecondaryContainer,
          fontSize: 20,
        ),
      ),
    ),
  );
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: _generateTheme(ThemeData.dark(), kDarkColorScheme),
      theme: _generateTheme(ThemeData(), kColorScheme),
      home: const Expenses(),
      themeMode: ThemeMode.system,
    ),
  );
}
