// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cadastro_contatos/src/page/contact_form_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ContactForm extends StatelessWidget {
  // Referência de um Widget
  final _form = GlobalKey<FormState>();

  Widget fieldName(ContactFormStore controller) {
    return TextFormField(
      validator: controller.validadeName,
      onSaved: (newValue) => controller.contact?.nome = newValue,
      initialValue: controller.contact?.nome,
      decoration: InputDecoration(labelText: 'Nome:'),
    );
  }

  Widget fieldEmail(ContactFormStore controller) {
    return TextFormField(
      validator: controller.validateEmail,
      onSaved: (newValue) => controller.contact?.email = newValue,
      initialValue: controller.contact?.email,
      decoration:
          InputDecoration(labelText: 'E-mail:', hintText: 'seuemail@email.com'),
    );
  }

  Widget fieldTelefone(ContactFormStore controller) {
    var mask = MaskTextInputFormatter(mask: '(##)#####-####');
    return TextFormField(
      // Validando
      validator: controller.validateTelefone,
      // Salvando o valor
      onSaved: (newValue) => controller.contact?.telefone = newValue,
      initialValue: controller.contact?.telefone,
      inputFormatters: [mask],
      keyboardType: TextInputType.number,
      decoration:
          InputDecoration(labelText: 'Telefone:', hintText: '(99) 99999-9999'),
    );
  }

  Widget fieldUrlImage(ContactFormStore controller) {
    return TextFormField(
      onSaved: (newValue) => controller.contact?.urlAvatar = newValue,
      initialValue: controller.contact?.urlAvatar,
      decoration:
          InputDecoration(labelText: 'Imagem:', hintText: 'www.imagem.com.br'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _controller = ContactFormStore(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de contato'),
        actions: [
          IconButton(
              onPressed: () {
                // Validando os campos quando clica em salvar
                _form.currentState?.validate();
                _form.currentState?.save();
                if (_controller.isValid) {
                  _controller.save();
                  Navigator.of(context).pop();
                }
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Padding(
        // Atribuindo a referencia
        key: _form,
        padding: EdgeInsets.all(10),
        child: Form(
            child: Column(
          children: [
            fieldName(_controller),
            fieldEmail(_controller),
            fieldTelefone(_controller),
            fieldUrlImage(_controller)
          ],
        )),
      ),
    );
  }
}
