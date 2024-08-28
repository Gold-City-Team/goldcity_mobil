// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewsViewModel on _NewsViewModelBase, Store {
  late final _$entityAtom =
      Atom(name: '_NewsViewModelBase.entity', context: context);

  @override
  List<EducationEntity>? get entity {
    _$entityAtom.reportRead();
    return super.entity;
  }

  @override
  set entity(List<EducationEntity>? value) {
    _$entityAtom.reportWrite(value, super.entity, () {
      super.entity = value;
    });
  }

  late final _$_getDataAsyncAction =
      AsyncAction('_NewsViewModelBase._getData', context: context);

  @override
  Future<void> _getData() {
    return _$_getDataAsyncAction.run(() => super._getData());
  }

  @override
  String toString() {
    return '''
entity: ${entity}
    ''';
  }
}
