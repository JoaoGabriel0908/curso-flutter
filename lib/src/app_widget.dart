// ignore_for_file: prefer_const_constructors

import 'package:cadastro_contatos/src/page/contactForm.dart';
import 'package:cadastro_contatos/src/page/contactList.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const FORM = 'contact-form';

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        HOME: (context) => ContactList(),
        FORM: (context) => ContactForm()
      },
    );
  }
}
