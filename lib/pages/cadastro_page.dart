import 'package:flutter/material.dart';
import 'package:poupex/helpers/database_helper.dart'; // ajuste se o caminho for diferente

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  Future<void> _cadastrar() async {
    final email = _emailController.text.trim();
    final senha = _senhaController.text;

    if (email.isEmpty || senha.isEmpty) {
      _mostrarDialogo('Erro', 'Preencha todos os campos.');
      return;
    }

    try {
      await DatabaseHelper.insertUser(email, senha);
      _mostrarDialogo('Sucesso', 'Usuário cadastrado com sucesso!', fechar: true);
    } catch (e) {
      _mostrarDialogo('Erro', 'E-mail já está em uso.');
    }
  }

  void _mostrarDialogo(String titulo, String mensagem, {bool fechar = false}) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(titulo),
        content: Text(mensagem),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (fechar) Navigator.pop(context); // volta para login
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _cadastrar,
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
