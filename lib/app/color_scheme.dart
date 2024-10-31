import 'package:flutter/material.dart';

final lightColorScheme = ColorScheme.light(
  primary: Colors.blue,
  primaryContainer: Colors.blue[200]!,
  secondary: Colors.amber,
  secondaryContainer: Colors.amber[200]!,
  background: Colors.white,
  surface: Colors.grey[100]!,
  error: Colors.redAccent,
  onPrimary: Colors.white,
  onSecondary: Colors.black,
  onBackground: Colors.black,
  onSurface: Colors.black,
  onError: Colors.white,
);


final darkColorScheme = ColorScheme.dark(
  primary: Colors.blue[300]!,
  primaryContainer: Colors.blue[700]!,
  secondary: Colors.amber[300]!,
  secondaryContainer: Colors.amber[700]!,
  background: Colors.black,
  surface: Colors.grey[850]!,
  error: Colors.redAccent,
  onPrimary: Colors.black,
  onSecondary: Colors.white,
  onBackground: Colors.white,
  onSurface: Colors.white,
  onError: Colors.black,
);