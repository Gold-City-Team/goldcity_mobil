// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$projectListAtom =
      Atom(name: '_HomeViewModelBase.projectList', context: context);

  @override
  List<ProjectEntity>? get projectList {
    _$projectListAtom.reportRead();
    return super.projectList;
  }

  @override
  set projectList(List<ProjectEntity>? value) {
    _$projectListAtom.reportWrite(value, super.projectList, () {
      super.projectList = value;
    });
  }

  late final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase', context: context);

  @override
  void _getProjectList() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase._getProjectList');
    try {
      return super._getProjectList();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
projectList: ${projectList}
    ''';
  }
}