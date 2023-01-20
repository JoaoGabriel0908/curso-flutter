// ignore_for_file: prefer_const_constructors

import 'package:cadastro_contatos/src/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContactList extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
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
          var contato = lista[index];
          var avatar = CircleAvatar(
            backgroundImage: NetworkImage(contato['avatar']!),
          );
          return ListTile(
            leading: avatar,
            title: Text(contato['nome']!),
            subtitle: Text(contato['telefone']!),
            trailing: Container(
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
        itemCount: lista.length,
      ),
    );
  }
}
