import 'package:flutter/material.dart';
import '../models/flavor_config.dart';
import 'home_page.dart'; // seu MyHomePage

class SplashScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final VoidCallback onLogout;
  final FlavorConfig flavorConfig;

  const SplashScreen({
    super.key,
    required this.onToggleTheme,
    required this.onLogout,
    required this.flavorConfig,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(
            onToggleTheme: widget.onToggleTheme,
            onLogout: widget.onLogout,
            flavorConfig: widget.flavorConfig,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/icon/icon.png', height: 100), // seu logo
            const SizedBox(height: 20),
            const Text(
              'Carregando Poupex...',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
