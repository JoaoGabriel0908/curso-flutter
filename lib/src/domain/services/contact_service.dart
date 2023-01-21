// Serviço da camada de dominio que representa e emcapsula as regras de negócios
// A regra de negócio aqui vai precisar do DAO (Operações do banco ded daos)
import 'package:cadastro_contatos/src/database/sqlite/dao/contact_dao_impl.dart';
import 'package:get_it/get_it.dart';
import '../interfaces/contact_dao.dart';

class ContactService {
  // Aqui definimos na tecnologia, caso for mudar aqui não irá mais funcionar
  // var dao = ContactDAOImpl();

  // Injetando o DAO no contactService
  var dao = GetIt.I.get<ContactDAO>();
}
