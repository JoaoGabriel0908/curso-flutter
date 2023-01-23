// ignore_for_file: unused_field, empty_constructor_bodies

import 'package:cadastro_contatos/src/app_widget.dart';
import 'package:cadastro_contatos/src/domain/entities/Contact.dart';
import 'package:cadastro_contatos/src/domain/services/contact_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'contact_list_store.g.dart';

class ContactListStore = _ContactListStore with _$ContactListStore;

abstract class _ContactListStore with Store {
  final _service = GetIt.I.get<ContactService>();

  // Quando a classe é chamado, atualizamos a lista
  _ContactListStore() {
    refreshList();
  }

  // Lista de contatos
  @observable
  Future<List<Contact>>? list;

  // Precisaremos de um método para atualizar a lista de contatos
  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  // Métodos para chamar o formulário Salvar/Alterar
  goToForm(BuildContext context, [Contact? contact]) {
    // Quando navegamos para salvar ou alterar um contato chamamos a rota
    // E no argumento, caso formos alterar, ele pede o contato que foi selecionado
    // Push Named retorna uma ação futura que é quando o usuário For navegar para a página
    // quando isso ocorrer, ele vai executar o then.
    Navigator.of(context)
        .pushNamed(MyApp.FORM, arguments: contact)
        .then(refreshList);
  }

  // Excluir
  remove(int id) {
    _service.remove(id);
    refreshList();
  }
}
