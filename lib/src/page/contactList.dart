// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, empty_catches, use_function_type_syntax_for_parameters

import 'dart:developer';

import 'package:cadastro_contatos/src/app_widget.dart';
import 'package:cadastro_contatos/src/database/sqlite/connection.dart';
import 'package:cadastro_contatos/src/database/sqlite/dao/contact_dao_impl.dart';
import 'package:cadastro_contatos/src/database/sqlite/script.dart';
import 'package:cadastro_contatos/src/domain/entities/Contact.dart';
import 'package:cadastro_contatos/src/page/contact_list_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ContactList extends StatelessWidget {
  // Método privado usando "_" para buscar consultas no banco
  // Lista de Maps<que toda chave é uma String e os valores são dinâmicos>
  // Future, para funções assíncronas que futuramente irá retornar o valor
  final _controller = ContactListStore();
  // late final VoidCallback onPressed;

  // Método que cria o avata a partir da imagem que foi adicionada
  CircleAvatar circleAvatar(String url) {

    // URI.parse converte o endereço em string
    return (Uri.parse(url).isAbsolute)
        ? CircleAvatar(
            backgroundImage: NetworkImage(url),
          )
        : CircleAvatar(
            child: Icon(Icons.person),
          );
  }

  Widget iconEditButton(VoidCallback onPressed) {
    return IconButton(
        icon: Icon(
          Icons.edit,
          color: Colors.orange,
        ),
        onPressed: onPressed);
  }

  Widget iconRemove(BuildContext context, VoidCallback remove) {
    return IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                      title: Text('Excluir'),
                      content: Text('Confirma a exclusão?'),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Não'),
                        ),
                        ElevatedButton(onPressed: remove, child: Text('Sim'))
                      ]));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de contatos'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(MyApp.FORM);
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: Observer(
          builder: (context) {
            return FutureBuilder(
                future: _controller.list,
                builder: (context, futuro) {
                  // Se não tiver nada na lista ele carrega
                  if (!futuro.hasData) {
                    return CircularProgressIndicator();
                    // Caso tiver ele mostra a lista
                  } else {
                    List<Contact>? lista = futuro.data;
                    return ListView.builder(
                      itemCount: lista!.length,
                      // A lista passa por todos os indices do arrar, armazenando seu indice no index
                      itemBuilder: (context, index) {
                        var contato = lista[index];
                        return ListTile(
                          leading: circleAvatar(contato.urlAvatar!),
                          title: Text(contato.nome!),
                          subtitle: Text(contato.telefone!),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                iconEditButton(() {
                                  _controller.goToForm(context, contato);
                                }),
                                iconRemove(context, () {
                                  _controller.remove(contato.id!);
                                  Navigator.of(context).pop();
                                })
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                });
          },
        ));
  }
}
