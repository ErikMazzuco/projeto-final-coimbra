import 'package:flutter/material.dart';
import 'models/flavor_config.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/splash_screen.dart';

enum AppState { splash, login, home }

class PoupexApp extends StatefulWidget {
  final FlavorConfig flavorConfig;
  const PoupexApp({super.key, required this.flavorConfig});

  @override
  State<PoupexApp> createState() => _PoupexAppState();
}

class _PoupexAppState extends State<PoupexApp> {
  bool _isDarkMode = false;
  AppState _appState = AppState.splash;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  void _goToLogin() {
    setState(() {
      _appState = AppState.login;
    });
  }

  void _login() {
    setState(() {
      _appState = AppState.home;
    });
  }

  void _logout() {
    setState(() {
      _appState = AppState.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentPage;

    switch (_appState) {
      case AppState.splash:
        currentPage = SplashScreen(
          flavorConfig: widget.flavorConfig,
          onToggleTheme: _toggleTheme,
          onLogout: _logout,
          onLogin: _goToLogin,
        );
        break;
      case AppState.login:
        currentPage = LoginPage(
          onLogin: _login,
        );
        break;
      case AppState.home:
        currentPage = MyHomePage(
          flavorConfig: widget.flavorConfig,
          onToggleTheme: _toggleTheme,
          onLogout: _logout,
        );
        break;
    }

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
      home: currentPage,
    );
  }
}
