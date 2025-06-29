import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _db;

  static Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  static Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), 'poupex.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Tabela de usuários
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT UNIQUE NOT NULL,
            senha TEXT NOT NULL
          )
        ''');

        // Tabela de cards da home
        await db.execute('''
          CREATE TABLE cards (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            titulo TEXT NOT NULL,
            descricao TEXT,
            cor TEXT,
            value REAL
          )
        ''');
      },
    );
  }

  // ============================
  // USUÁRIOS
  // ============================

  static Future<void> insertUser(String email, String senha) async {
    final dbClient = await db;
    await dbClient.insert(
      'users',
      {'email': email, 'senha': senha},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<bool> login(String email, String senha) async {
    final dbClient = await db;
    final result = await dbClient.query(
      'users',
      where: 'email = ? AND senha = ?',
      whereArgs: [email, senha],
    );
    return result.isNotEmpty;
  }

  // ============================
  // CARDS
  // ============================

  static Future<void> insertCard(String titulo, String descricao, String cor, double value) async {
    final dbClient = await db;
    await dbClient.insert(
      'cards',
      {
        'titulo': titulo,
        'descricao': descricao,
        'cor': cor,
        'value': value,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getCards() async {
    final dbClient = await db;
    return dbClient.query('cards');
  }

  static Future<void> deleteCard(int id) async {
    final dbClient = await db;
    await dbClient.delete('cards', where: 'id = ?', whereArgs: [id]);
  }


  // ============================
  // METODOS PARA BILLS
  // ============================

  static Future<void> insertBill(String name, double value) async {
  final dbClient = await db;
  await dbClient.insert(
    'cards', // aqui é o nome da tabela onde você guarda os bills
    {
      'titulo': name,
      'descricao': '', // se quiser, pode adaptar para ter descrição
      'cor': '',       // se quiser, pode adaptar para cor
      'value': value,  // se adicionou essa coluna, se não, remova
    },
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

static Future<List<Map<String, dynamic>>> getBills() async {
  final dbClient = await db;
  return dbClient.query('cards'); // tabela dos cards/bills
}

static Future<void> deleteBill(int id) async {
  final dbClient = await db;
  await dbClient.delete('cards', where: 'id = ?', whereArgs: [id]);
}

}
