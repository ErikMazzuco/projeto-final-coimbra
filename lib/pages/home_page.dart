import 'package:flutter/material.dart';
import '../models/flavor_config.dart';
import 'package:poupex/helpers/database_helper.dart';

class Bill {
  final int? id;
  final String name;
  final double value;

  Bill({this.id, required this.name, required this.value});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'value': value,
    };
  }

  factory Bill.fromMap(Map<String, dynamic> map) {
    return Bill(
      id: map['id'],
      name: map['titulo'],
      value: map['value'],
    );
  }
}

class MyHomePage extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final FlavorConfig flavorConfig;
  final VoidCallback onLogout;

  const MyHomePage({
    super.key,
    required this.onToggleTheme,
    required this.onLogout,
    required this.flavorConfig,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState(flavorConfig: flavorConfig);
}

class _MyHomePageState extends State<MyHomePage> {
  final FlavorConfig _flavorConfig;
  int _selectedIndex = 0;
  final List<Bill> _bills = [];

  _MyHomePageState({required FlavorConfig flavorConfig}) : _flavorConfig = flavorConfig;

  @override
  void initState() {
    super.initState();
    _carregarContas();
  }

  Future<void> _carregarContas() async {
    final data = await DatabaseHelper.getBills();
    setState(() {
      _bills.clear();
      _bills.addAll(data.map((e) => Bill.fromMap(e)));
    });
  }

  void _showAddBillDialog() {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController valueController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Nova Conta'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nome da Conta',
                hintText: 'Digite o nome da conta',
              ),
              textInputAction: TextInputAction.next,
            ),
            TextField(
              controller: valueController,
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)',
                hintText: 'Digite o valor da conta',
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.done,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () async {
              final name = nameController.text.trim();
              final value = double.tryParse(valueController.text.trim()) ?? 0.0;

              if (name.isNotEmpty && value > 0) {
                await DatabaseHelper.insertBill(name, value);
                await _carregarContas();
                Navigator.of(context).pop();
              }
            },
            child: const Text('Adicionar'),
          ),
        ],
      ),
    );
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
          final bill = _bills[index];
          return Semantics(
            label: 'Conta: ${bill.name}, valor: R\$ ${bill.value.toStringAsFixed(2)}',
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Row(
                children: [
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bill.name,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'R\$ ${bill.value.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Colors.black54
                                  : Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    tooltip: 'Excluir conta ${bill.name}',
                    onPressed: () async {
                      final billId = _bills[index].id;
                      if (billId != null) {
                        await DatabaseHelper.deleteBill(billId);
                        await _carregarContas();
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else if (_selectedIndex == 1) {
      return const Center(child: Text('Resumo financeiro em breve...'));
    } else {
      return const Center(child: Text('Dashboard em breve...'));
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
            tooltip: 'Alternar tema',
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(gradient: _gradient),
          child: Column(
            children: [
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
              Semantics(
                button: true,
                label: 'Ir para a página Início',
                child: const ListTile(
                  leading: Icon(Icons.home, color: Colors.white),
                  title: Text('Início', style: TextStyle(color: Colors.white)),
                ),
              ),
              Semantics(
                button: true,
                label: 'Ir para a página Resumo',
                child: const ListTile(
                  leading: Icon(Icons.analytics, color: Colors.white),
                  title: Text('Resumo', style: TextStyle(color: Colors.white)),
                ),
              ),
              Semantics(
                button: true,
                label: 'Ir para Configurações',
                child: const ListTile(
                  leading: Icon(Icons.settings, color: Colors.white),
                  title: Text('Configurações', style: TextStyle(color: Colors.white)),
                ),
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
      floatingActionButton: _selectedIndex == 0
          ? Semantics(
              button: true,
              label: 'Adicionar nova conta',
              child: FloatingActionButton(
                onPressed: _showAddBillDialog,
                tooltip: 'Adicionar Conta',
                child: const Icon(Icons.add, semanticLabel: 'Adicionar Conta'),
              ),
            )
          : null,
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
            BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          ],
        ),
      ),
    );
  }
}
