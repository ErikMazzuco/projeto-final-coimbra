import 'package:flutter/material.dart';
import 'models/flavor_config.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/splash_screen.dart'; 

class PoupexApp extends StatefulWidget {
  final FlavorConfig flavorConfig;
  const PoupexApp({super.key, required this.flavorConfig});

  @override
  State<PoupexApp> createState() => _PoupexAppState();
}

class _PoupexAppState extends State<PoupexApp> {
  bool _isDarkMode = false;
  bool _isLoggedIn = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  void _login() {
    setState(() {
      _isLoggedIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color seedBlue = const Color(0xFF2F80ED);

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
      home: SplashScreen(
        flavorConfig: widget.flavorConfig,
        onToggleTheme: _toggleTheme,
        onLogout: () {
          setState(() {
            _isLoggedIn = false;
          });
        },
      ),
    );
  }
}
