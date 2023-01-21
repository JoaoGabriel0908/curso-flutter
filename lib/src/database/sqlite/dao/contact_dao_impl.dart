// ignore_for_file: unnecessary_null_comparison
// Implementação de uma tecnologia específica, aqui no caso foi o SQLLite

import 'package:cadastro_contatos/src/database/sqlite/connection.dart';
import 'package:cadastro_contatos/src/domain/entities/Contact.dart';
import 'package:cadastro_contatos/src/domain/interfaces/contact_dao.dart';
import 'package:sqflite/sqflite.dart';

// Implementando a classe ContactDAO
class ContactDAOImpl implements ContactDAO {
  Database? _db;

  // Objeto para salvar, editar, excluir e consultar dados
  @override
  Future<List<Contact>> find() async {
    _db = await Connection.get();
    // Criando uma lista de maps{String, dynamic} que recebe os dados da tabela contact
    List<Map<String, dynamic>> resultado = await _db!.query('contact');
    // Criando uma lista de Contatos que recebe os dados gerados
    // Recebendo o tamanho
    List<Contact> lista = List.generate(resultado.length, (index) {
      // Pra cada resultado recebo uma linha do respectivo contato
      var linha = resultado[index];
      return Contact(
        id: linha['id'] ?? 0,
        nome: linha['nome'],
        telefone: linha['telefone'],
        email: linha['email'],
        urlAvatar: linha['url_avatar'],
      );
    });
    return lista;
  }

  @override
  remove(int id) async {
    _db = await Connection.get();
    var sql = "DELETE FROM contact WHERE id=?";
    _db?.rawDelete(sql, [id]);
  }

  @override
  save(Contact contact) async {
    // Inserir dados no banco
    // Variavel _db recebe a conexão
    _db = await Connection.get();
    String sql;
    if (contact.id == null) {
      // SQL comando para adicionar um contato
      sql =
          "INSERT INTO contact (nome, telefone, email, url_avatar) Values (?, ?, ?, ?)";
      // Inserindo no database os dados do sql
      _db?.rawInsert(sql,
          [contact.nome, contact.telefone, contact.email, contact.urlAvatar]);
    } else {
      sql =
          'UPTADE contact SET nome = ?, telefone = ?, email = ?, url_avatar = ? WHERE id = ?';
      _db?.rawUpdate(sql, [
        contact.nome,
        contact.telefone,
        contact.email,
        contact.urlAvatar,
        contact.id
      ]);
    }
  }
}
