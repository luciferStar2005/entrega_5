import 'package:flutter/material.dart';

const _semilla = Color.fromARGB(255, 233, 247, 108);
final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: _semilla),

  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: const Color.fromARGB(0, 27, 15, 15),
  ),

  cardTheme: CardThemeData(
    elevation: 0,
    margin: EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
  ),

  chipTheme: ChipThemeData(
    showCheckmark: false,
    side: BorderSide(color: Colors.transparent),
  ),

  listTileTheme: ListTileThemeData(
    contentPadding: EdgeInsetsDirectional.symmetric(horizontal: 12),
  ),
);
