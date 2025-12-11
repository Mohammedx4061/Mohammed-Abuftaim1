import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDatabase {
  static Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      _database = await _initializeDatabase();
    }
    return _database;
  }

  Future<Database> _initializeDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'app_database.db');

    Database database = await openDatabase(
      path,
      onCreate: _createTables,
      version: 3,
      onUpgrade: _upgradeDatabase,
    );

    return database;
  }

  Future<void> _createTables(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        note TEXT NOT NULL,
        created_at TEXT DEFAULT CURRENT_TIMESTAMP
      )
    ''');

    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL,
        email TEXT,
        created_at TEXT DEFAULT CURRENT_TIMESTAMP
      )
    ''');

    await db.execute('''
      CREATE TABLE products (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        category TEXT NOT NULL,
        description TEXT,
        price REAL,
        quantity INTEGER DEFAULT 0,
        created_at TEXT DEFAULT CURRENT_TIMESTAMP
      )
    ''');
  }

  Future<void> _upgradeDatabase(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
        CREATE TABLE IF NOT EXISTS products (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          category TEXT NOT NULL,
          description TEXT,
          price REAL,
          quantity INTEGER DEFAULT 0,
          created_at TEXT DEFAULT CURRENT_TIMESTAMP
        )
      ''');
    }

    if (oldVersion < 3) {
      await db.execute('ALTER TABLE users ADD COLUMN email TEXT');
      await db.execute('ALTER TABLE notes ADD COLUMN created_at TEXT DEFAULT CURRENT_TIMESTAMP');
      await db.execute('ALTER TABLE users ADD COLUMN created_at TEXT DEFAULT CURRENT_TIMESTAMP');
      await db.execute('ALTER TABLE products ADD COLUMN created_at TEXT DEFAULT CURRENT_TIMESTAMP');
    }
  }

  Future<List<Map<String, dynamic>>> query(String sql, [List<dynamic>? arguments]) async {
    final Database? db = await database;
    return await db!.rawQuery(sql, arguments ?? []);
  }

  Future<int> insert(String sql, [List<dynamic>? arguments]) async {
    final Database? db = await database;
    return await db!.rawInsert(sql, arguments ?? []);
  }

  Future<int> update(String sql, [List<dynamic>? arguments]) async {
    final Database? db = await database;
    return await db!.rawUpdate(sql, arguments ?? []);
  }

  Future<int> delete(String sql, [List<dynamic>? arguments]) async {
    final Database? db = await database;
    return await db!.rawDelete(sql, arguments ?? []);
  }

  Future<List<Map<String, dynamic>>> getAllNotes() async {
    return await query('SELECT * FROM notes ORDER BY created_at DESC');
  }

  Future<int> insertNote(String note) async {
    return await insert('INSERT INTO notes (note) VALUES (?)', [note]);
  }

  Future<int> updateNote(int id, String note) async {
    return await update('UPDATE notes SET note = ? WHERE id = ?', [note, id]);
  }

  Future<int> deleteNote(int id) async {
    return await delete('DELETE FROM notes WHERE id = ?', [id]);
  }

  Future<void> close() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
}