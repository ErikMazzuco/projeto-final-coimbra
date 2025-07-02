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
  bool startAnimation = false;

  @override
  void initState() {
    super.initState();

    // Inicia a animação após um pequeno atraso
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        startAnimation = true;
      });
    });

    // Executa o onLogin após 2s (como você já fazia)
    Future.delayed(const Duration(seconds: 2), () {
      widget.onLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Animação de imagem descendo
            AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              margin: EdgeInsets.only(top: startAnimation ? 0 : 50, bottom: 20),
              curve: Curves.easeOut,
              child: Image.asset('assets/icon/icon.png', height: 100),
            ),

            // Nome do app aparecendo
            AnimatedOpacity(
              opacity: startAnimation ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 800),
              child: const Text(
                'Poupex',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Texto "Carregando..." e o indicador
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
