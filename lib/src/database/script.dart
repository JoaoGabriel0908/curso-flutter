// ignore: prefer_const_declarations
// ignore_for_file: prefer_const_declarations

final createTable = """
 CREATE TABLE contact(
  id INT NOT NULL PRIMARY KEY,
  nome VARCHAR(200) NOT NULL,
  telefone VARCHAR(200) NOT NULL,
  email VARCHAR(200) NOT NULL,
  url_avatar VARCHAR(300) NOT NULL,
 )
""";

final insert1 = """
  INSERT INTO contact(nome,telefone,email,url_avatar)
  VALUES("Pietro","(11)987456123","pietro@gmail.com","https://cdn.pixabay.com/photo/2016/08/20/05/38/avatar-1606916__340.png")
""";

final insert2 = """
  INSERT INTO contact(nome,telefone,email,url_avatar)
  VALUES("Ana","(11)945612345","ana@gmail.com","https://cdn.pixabay.com/photo/2014/04/03/10/32/user-310807__340.png")
""";

final insert3 = """
  INSERT INTO contact(nome,telefone,email,url_avatar)
  VALUES("Bia","(11)987456123","bia@gmail.com","https://cdn.pixabay.com/photo/2022/12/17/14/21/woman-7661776__340.png")
""";

final lista = [
  {
    'nome': 'Pietro',
    'telefone': '(11)965478954',
    'avatar':
        'https://cdn.pixabay.com/photo/2016/08/20/05/38/avatar-1606916__340.png'
  },
  {
    'nome': 'Ana',
    'telefone': '(11)978944567',
    'avatar':
        'https://cdn.pixabay.com/photo/2014/04/03/10/32/user-310807__340.png'
  },
  {
    'nome': 'Bia',
    'telefone': '(11)987456123',
    'avatar':
        'https://cdn.pixabay.com/photo/2022/12/17/14/21/woman-7661776__340.png'
  },
];
