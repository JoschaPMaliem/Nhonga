import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'nhonga_app.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE vendedores(
      id TEXT PRIMARY KEY,
      nome TEXT,
      email TEXT,
      telefone TEXT,
      password TEXT
    )
    ''');

    await db.execute('''
    CREATE TABLE clientes(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      email TEXT,
      telefone TEXT,
      endereco TEXT,
      password TEXT
    )
    ''');
  }

  Future<int> insertVendedor(Map<String, dynamic> vendedor) async {
    Database db = await database;
    return await db.insert('vendedores', vendedor);
  }

  Future<int> insertCliente(Map<String, dynamic> cliente) async {
    Database db = await database;
    return await db.insert('clientes', cliente);
  }

  Future<Map<String, dynamic>?> getVendedorByEmail(String email) async {
    Database db = await database;
    List<Map<String, dynamic>> results = await db.query('vendedores', where: 'email = ?', whereArgs: [email]);
    if (results.isNotEmpty) {
      return results.first;
    }
    return null;
  }

  Future<Map<String, dynamic>?> getClienteByEmail(String email) async {
    Database db = await database;
    List<Map<String, dynamic>> results = await db.query('clientes', where: 'email = ?', whereArgs: [email]);
    if (results.isNotEmpty) {
      return results.first;
    }
    return null;
  }

  Future<int> updateCliente(Map<String, dynamic> cliente) async {
    Database db = await database;
    return await db.update('clientes', cliente, where: 'email = ?', whereArgs: [cliente['email']]);
  }

  Future<int> updateVendedor(Map<String, dynamic> vendedor) async {
    Database db = await database;
    return await db.update('vendedores', vendedor, where: 'email = ?', whereArgs: [vendedor['email']]);
  }
}
