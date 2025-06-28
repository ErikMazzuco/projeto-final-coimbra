import 'package:flutter/material.dart';
import '../models/flavor_config.dart';
import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  final FlavorConfig flavorConfig;
  final VoidCallback onToggleTheme;
  final VoidCallback onLogout;
   final VoidCallback onLogin;

  const SplashScreen({
    super.key,
    required this.flavorConfig,
    required this.onToggleTheme,
    required this.onLogout,
    required this.onLogin,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
void initState() {
  super.initState();

  Future.delayed(const Duration(seconds: 2), () {
    widget.onLogin(); // vai marcar como "login necessário"
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
            Image.asset('assets/icon/icon.png', height: 100),
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

