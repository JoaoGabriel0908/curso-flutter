// ignore_for_file: unused_element, unused_field
import 'package:cadastro_contatos/src/domain/entities/Contact.dart';
import 'package:cadastro_contatos/src/domain/services/contact_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'contact_form_store.g.dart';

class ContactFormStore = _ContactFormStore with _$ContactFormStore;

abstract class _ContactFormStore with Store {
  Contact? contact;
  final _service = GetIt.I.get<ContactService>();
  @observable
  bool? _nameIsValid;
  bool? _emailIsValid;
  bool? _telefoneIsValid;

  // Validação geral só estará okay se os dados estiverem preenchidos
  @computed
  bool get isValid => _nameIsValid! && _emailIsValid! && _telefoneIsValid!;

  // Diferenciar novo com alteração
  // Construtor que tem o context
  _ContactFormStore(BuildContext context) {
    // Recebendo o parametro da rota e criando um modal
    var parametro = ModalRoute.of(context)?.settings.arguments;
    // Se parametros estiver nulo, ele irá cadastrar
    if ((parametro == null)) {
      contact = Contact();
      // Caso não estiver ele recebe os parametros dos dados
    } else {
      contact = parametro as Contact;
    }
  }

  // Salvar
  save() async {
    await _service.save(contact!);
  }

  // Validações
  String? validadeName(String? name) {
    try {
      _nameIsValid = true;
      return null;
    } catch (e) {
      _nameIsValid = false;
      return e.toString();
    }
  }

  String? validateEmail(String? email) {
    try {
      _emailIsValid = true;
      return null;
    } catch (e) {
      _emailIsValid = false;
      return e.toString();
    }
  }

  String? validateTelefone(String? telefone) {
    try {
      _telefoneIsValid = true;
      return null;
    } catch (e) {
      _telefoneIsValid = false;
      return e.toString();
    }
  }
}
