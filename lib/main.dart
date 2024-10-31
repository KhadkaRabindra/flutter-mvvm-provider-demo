import 'package:flutter/material.dart';
import 'package:mvvm_demo/view/pages/statistics_page.dart';
import 'package:mvvm_demo/view_model/theme_notifier.dart';
import 'package:provider/provider.dart';

import 'app/theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: themeNotifier.themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const StatisticsPage(),
    );
  }
}