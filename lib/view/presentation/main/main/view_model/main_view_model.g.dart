// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainViewModel on _MainViewModelBase, Store {
  late final _$indexAtom =
      Atom(name: '_MainViewModelBase.index', context: context);

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$_MainViewModelBaseActionController =
      ActionController(name: '_MainViewModelBase', context: context);

  @override
  void changeViewIndex(int newIndex) {
    final _$actionInfo = _$_MainViewModelBaseActionController.startAction(
        name: '_MainViewModelBase.changeViewIndex');
    try {
      return super.changeViewIndex(newIndex);
    } finally {
      _$_MainViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index}
    ''';
  }
}
