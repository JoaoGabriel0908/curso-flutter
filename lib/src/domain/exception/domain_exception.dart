// Classe pra criar excessões personalizadas
class DomainException implements Exception {
  String cause;

  DomainException(this.cause);

  @override
  String toString(){
    return cause;
  }
}