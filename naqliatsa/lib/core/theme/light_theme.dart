import 'package:flutter/material.dart';

import 'border_theme.dart';
import 'colory.dart';

ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Colors.lightBlue,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    // ! _____ Input _____ ! //
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colory.lightBg,
      hintStyle: TextStyle(fontSize: 12, color: Colors.grey.shade500),
      labelStyle: TextStyle(fontSize: 12, color: Colors.grey.shade500),
      suffixIconColor: Colors.grey,
      prefixIconColor: Colors.grey,
      contentPadding: const EdgeInsets.all(16),
      border: buildBorder(),
      enabledBorder: buildBorder(),
      disabledBorder: buildBorder(),
      focusedErrorBorder: buildBorder(),
      focusedBorder: buildFocusedBorder(),
    ),
    // ! _____ Main Button _____ ! //
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(0, 55),
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    // ! _____ Main Button _____ ! //
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(fontSize: 13, fontWeight: .bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    // ! _____ ListTile _____ ! //
    listTileTheme: ListTileThemeData(
      dense: false,
      tileColor: Colory.lightBg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.lightBlue.shade100),
      ),
      titleTextStyle: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
      textColor: Colors.black,
      iconColor: Colors.grey.shade600,
      // subtitleTextStyle: AppText.regular14(),
    ),
    // ! _____ Bottom Sheet _____ ! //
    bottomSheetTheme: BottomSheetThemeData(
      showDragHandle: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );
}
