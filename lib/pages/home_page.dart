import 'package:flutter/material.dart';
import '../models/flavor_config.dart';

class MyHomePage extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final FlavorConfig flavorConfig;
  final VoidCallback onLogout;

  const MyHomePage({super.key, required this.onToggleTheme, required this.onLogout, required this.flavorConfig});

  @override
  State<MyHomePage> createState() => _MyHomePageState(flavorConfig: flavorConfig);
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

  LinearGradient get _gradient => const LinearGradient(
        colors: [Colors.pinkAccent, Colors.blueAccent],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  Widget _buildBody() {
    if (_selectedIndex == 0) {
      return ListView.builder(
        itemCount: _bills.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            child: Row(
              children: [
                // Parte com degradê
                Container(
                  width: MediaQuery.of(context).size.width * 0.4 - 24,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: _gradient,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: const Icon(Icons.receipt_long, color: Colors.white, size: 40),
                  alignment: Alignment.center,
                ),
                // Parte com texto
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      _bills[index],
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
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
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: _gradient),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),
      drawer: Drawer(
  child: Container(
    decoration: BoxDecoration(gradient: _gradient),
    child: Column(
      children: [
        // Perfil com botão de sair embutido
        UserAccountsDrawerHeader(
          decoration: const BoxDecoration(color: Colors.transparent),
          currentAccountPicture: const CircleAvatar(
            backgroundImage: AssetImage('assets/icon/icon.png'),
          ),
          accountName: const Text(
            'Erik Mazzuco',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          accountEmail: const Text(
            'erik.mazzuco@email.com',
            style: TextStyle(fontSize: 14),
          ),
          otherAccountsPictures: [
            IconButton(
              icon: const Icon(Icons.logout, color: Colors.white),
              tooltip: 'Sair',
              onPressed: widget.onLogout,
            ),
          ],
        ),

        // Menu
        const ListTile(
          leading: Icon(Icons.home, color: Colors.white),
          title: Text('Início', style: TextStyle(color: Colors.white)),
        ),
        const ListTile(
          leading: Icon(Icons.analytics, color: Colors.white),
          title: Text('Resumo', style: TextStyle(color: Colors.white)),
        ),
        const ListTile(
          leading: Icon(Icons.settings, color: Colors.white),
          title: Text('Configurações', style: TextStyle(color: Colors.white)),
        ),

        const Spacer(),

        const Divider(color: Colors.white54),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              Text('Poupex App', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('Versão 1.0.0', style: TextStyle(color: Colors.white70, fontSize: 12)),
              SizedBox(height: 4),
              Text('© 2025 Poupex', style: TextStyle(color: Colors.white70, fontSize: 12)),
            ],
          ),
        ),
      ],
    ),
  ),
),



      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addBill,
        tooltip: 'Adicionar Conta',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(gradient: _gradient),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onNavItemTapped,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Contas'),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Resumo'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          ],
        ),
      ),
    );
  }
}
