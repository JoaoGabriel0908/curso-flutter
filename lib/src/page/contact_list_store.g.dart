// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContactListStore on _ContactListStore, Store {
  late final _$listAtom =
      Atom(name: '_ContactListStore.list', context: context);

  @override
  Future<List<Contact>>? get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Contact>>? value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$_ContactListStoreActionController =
      ActionController(name: '_ContactListStore', context: context);

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_ContactListStoreActionController.startAction(
        name: '_ContactListStore.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_ContactListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
