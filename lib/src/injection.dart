import 'package:cadastro_contatos/src/database/sqlite/dao/contact_dao_impl.dart';
import 'package:cadastro_contatos/src/domain/interfaces/contact_dao.dart';
import 'package:cadastro_contatos/src/domain/services/contact_service.dart';
import 'package:get_it/get_it.dart';

setUpInjection() {
  GetIt getIt = GetIt.I;

  // Quando precisarmos das operações do banco de Dados(ContactDAO)
  // o Getit vai injetar um objeto na implementação do DAOImplements
  getIt.registerSingleton<ContactDAO>(ContactDAOImpl());
  getIt.registerSingleton<ContactService>(ContactService());
}