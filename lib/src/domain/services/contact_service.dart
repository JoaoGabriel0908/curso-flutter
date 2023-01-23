// Serviço da camada de dominio que representa e emcapsula as regras de negócios
// A regra de negócio aqui vai precisar do DAO (Operações do banco ded daos)
// ignore_for_file: non_constant_identifier_names, unnecessary_new, unnecessary_null_comparison, unused_local_variable

import 'package:cadastro_contatos/src/database/sqlite/dao/contact_dao_impl.dart';
import 'package:cadastro_contatos/src/domain/entities/Contact.dart';
import 'package:cadastro_contatos/src/domain/exception/domain_exception.dart';
import 'package:get_it/get_it.dart';
import '../interfaces/contact_dao.dart';

class ContactService {
  // Aqui definimos na tecnologia, caso for mudar aqui não irá mais funcionar
  // var dao = ContactDAOImpl();

  // Injetando o DAO no contactService
  var _dao = GetIt.I.get<ContactDAO>();

  // Salvar um contato, ter a possibilidade de alterar, excluir e listar contatos
  save(Contact contact) {
    validadeName(contact.nome!);
    validadeEmail(contact.email!);
    validateTelefone(contact.telefone!);
    _dao.save(contact);
  }

  remove(int id) {
    _dao.remove(id);
  }

  Future<List<Contact>> find() {
    return _dao.find();
  }

  validadeName(String name) {
    var min = 3;
    var max = 50;

    if (name == null) {
      throw new DomainException('Nome obrigatório.');
    } else if (name.length < min) {
      throw new DomainException(
          'O nome deve possuir no mínimo $min caracteres.');
    } else if (name.length > max) {
      throw new DomainException(
          'O nome deve possuir no máximo $max caracteres.');
    }
  }

  validadeEmail(String email) {
    if (email == null) {
      throw new DomainException('Nome obrigatório.');
    } else if (email.contains('@')) {
      throw new DomainException('O email deve possuir @');
    }
  }

  validateTelefone(String telefone) {
    if (telefone == null) {
      throw new DomainException('Telefone obrigatório.');
    }
  }
}
