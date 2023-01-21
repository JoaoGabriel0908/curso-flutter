// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'dart:developer';

import 'package:cadastro_contatos/src/app_widget.dart';
import 'package:cadastro_contatos/src/database/sqlite/connection.dart';
import 'package:cadastro_contatos/src/database/sqlite/dao/contact_dao_impl.dart';
import 'package:cadastro_contatos/src/database/sqlite/script.dart';
import 'package:cadastro_contatos/src/domain/entities/Contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ContactList extends StatelessWidget {
  // Método privado usando "_" para buscar consultas no banco
  // Lista de Maps<que toda chave é uma String e os valores são dinâmicos>
  // Future, para funções assíncronas que futuramente irá retornar o valor
  Future<List<Contact>> _buscarDados() async {
    return ContactDAOImpl().find();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _buscarDados(),
        builder: (context, futuro) {
          if (futuro.hasData) {
            List<Contact>? lista = futuro.data;
            return Scaffold(
              appBar: AppBar(
                title: Text('Lista de contatos'),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(MyApp.HOME);
                      },
                      icon: Icon(Icons.add))
                ],
              ),
              body: ListView.builder(
                // A lista passa por todos os indices do arrar, armazenando seu indice no index
                itemBuilder: (context, index) {
                  var contato = lista?[index];
                  var avatar = CircleAvatar(
                    backgroundImage: NetworkImage(contato!.urlAvatar!),
                  );
                  return ListTile(
                    leading: avatar,
                    title: Text(contato.nome!),
                    subtitle: Text(contato.telefone!),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                          IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                        ],
                      ),
                    ),
                  );
                },
                itemCount: lista!.length,
              ),
            );
          } else {
            return Scaffold(
              body: Text('Sem dados'),
            );
          }
        });
  }
}
