import 'package:flutter/material.dart';
import '../models/flavor_config.dart';

class MyHomePage extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final FlavorConfig flavorConfig;

  const MyHomePage({super.key, required this.onToggleTheme, required this.flavorConfig});

  @override
  // ignore: no_logic_in_create_state
  State<MyHomePage> createState() => _MyHomePageState(flavorConfig : flavorConfig);
}

class _MyHomePageState extends State<MyHomePage> {
  final FlavorConfig _flavorConfig;
  int _selectedIndex = 0;
  final List<String> _bills = [];

  _MyHomePageState({required FlavorConfig flavorConfig}) : _flavorConfig = flavorConfig;
  
  void _addBill() {
    setState(() {
      _bills.add("Conta ${_bills.length + 1}");
    });
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildBody() {
    if (_selectedIndex == 0) {
      return ListView.builder(
        itemCount: _bills.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.receipt_long),
            title: Text(_bills[index]),
          );
        },
      );
    } else if (_selectedIndex == 1) {
      return const Center(child: Text('Resumo financeiro em breve...'));
    } else {
      return const Center(child: Text('Perfil e configurações em breve...'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Poupex ${FlavorConfig.title}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF2F80ED)),
              child: Text('Menu Poupex', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Início'),
            ),
            ListTile(
              leading: Icon(Icons.analytics),
              title: Text('Resumo'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
            ),
          ],
        ),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addBill,
        tooltip: 'Adicionar Conta',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Contas'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Resumo'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}