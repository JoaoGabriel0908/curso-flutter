import 'package:cadastro_contatos/src/domain/entities/Contact.dart';
// As operações são definidas aqui
// Classe abstrata onde não é possível instancia-la
abstract class ContactDAO{
  // Salva contatos
  save(Contact contact);

  // Exlcuir contato
  remove(int id);

  // Listar contatos
  Future<List<Contact>> find();
}