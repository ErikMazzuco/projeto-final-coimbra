import 'package:flutter/material.dart';
import 'models/flavor_config.dart';
import 'pages/home_page.dart';

class PoupexApp extends StatefulWidget {
  final FlavorConfig flavorConfig;
  const PoupexApp({super.key, required this.flavorConfig});
  

  @override
  State<PoupexApp> createState() => _PoupexAppState();
}

class _PoupexAppState extends State<PoupexApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final Color seedBlue = const Color(0xFF2F80ED); // Azul da logo

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Poupex',
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: seedBlue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedBlue,
          brightness: Brightness.dark,
        ),
      ),
      home: MyHomePage(
        onToggleTheme: () {
          setState(() {
            _isDarkMode = !_isDarkMode;
          });
        }, flavorConfig: FlavorConfig(),
      ),
    );
  }
}