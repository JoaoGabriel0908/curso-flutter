// Padronizando a forma de representar o contato
// Independente de como vir os dados, vamos padronizar dessa
class Contact {
  int id;
  String? nome;
  String? telefone;
  String? email;
  String? urlAvatar;

  // Construtor da classse
  // Parametros com {} é para quando for chamar o método, colocar a chave
  // Exemplo: id: '1', nome: '1', telefone: '1'....
  Contact(
      {required this.id, this.nome, this.telefone, this.email, this.urlAvatar});
}
