import 'package:flutter/material.dart';
import 'package:mvvm_demo/app/text_theme.dart';

import 'color_scheme.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: lightColorScheme,
  brightness: Brightness.light,
  primaryColor: lightColorScheme.primary,
  scaffoldBackgroundColor: lightColorScheme.background,
  textTheme: customTextTheme,
  useMaterial3: true,
);

final ThemeData darkTheme = ThemeData(
  colorScheme: darkColorScheme,
  brightness: Brightness.dark,
  primaryColor: darkColorScheme.primary,
  scaffoldBackgroundColor: darkColorScheme.background,
  textTheme: customTextTheme,
  useMaterial3: true,
);