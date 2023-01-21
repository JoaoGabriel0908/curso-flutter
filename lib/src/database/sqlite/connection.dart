// Classe que conecta com o sqlite
// ignore_for_file: unnecessary_null_comparison

import 'package:cadastro_contatos/src/database/sqlite/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database? _db;
  // Fazendo o caminho do banco de dados
  // Join(Plugin do Path) junta nos parametros o que vai ser o caminho da plataforma ou banco
  // GetDatabase função do SQFLite que traz o caminho onde o banco será criado
  // Nosso método irá futuramente retonar um database
  static Future<Database?> get() async {
    // Se ela não existir
    if (_db == null) {
      // Fazendo o caminho do banco de dados
      // Join(Plugin do Path) junta nos parametros o que vai ser o caminho da plataforma ou banco
      // GetDatabase função do SQFLite que traz o caminho onde o banco será criado
      var path = join(await getDatabasesPath(), 'banco');
      // Abertura do banco de dados
      // OnCreate verifica se tem algo no banco, se não tiver ele cria
      // Conforme tiver alterações no banco, use o onUpgrade e altere a versão
      _db = await openDatabase(
        path,
        version: 1,
        // Na criação passamos no primeiro parametro o banco de dados
        // No segundo parametro passamos a versão
        onCreate: (db, v) {
          db.execute(createTable);
          db.execute(insert1);
          db.execute(insert2);
          db.execute(insert3);
        },
      );
    }
    return _db;
  }
}
