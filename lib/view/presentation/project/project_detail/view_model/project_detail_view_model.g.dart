// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProjectDetailViewModel on _ProjectDetailViewModelBase, Store {
  late final _$templateIndexAtom =
      Atom(name: '_ProjectDetailViewModelBase.templateIndex', context: context);

  @override
  int get templateIndex {
    _$templateIndexAtom.reportRead();
    return super.templateIndex;
  }

  @override
  set templateIndex(int value) {
    _$templateIndexAtom.reportWrite(value, super.templateIndex, () {
      super.templateIndex = value;
    });
  }

  late final _$entityAtom =
      Atom(name: '_ProjectDetailViewModelBase.entity', context: context);

  @override
  ProjectEntity? get entity {
    _$entityAtom.reportRead();
    return super.entity;
  }

  @override
  set entity(ProjectEntity? value) {
    _$entityAtom.reportWrite(value, super.entity, () {
      super.entity = value;
    });
  }

  late final _$isPageSelectorVisibleAtom = Atom(
      name: '_ProjectDetailViewModelBase.isPageSelectorVisible',
      context: context);

  @override
  bool get isPageSelectorVisible {
    _$isPageSelectorVisibleAtom.reportRead();
    return super.isPageSelectorVisible;
  }

  @override
  set isPageSelectorVisible(bool value) {
    _$isPageSelectorVisibleAtom.reportWrite(value, super.isPageSelectorVisible,
        () {
      super.isPageSelectorVisible = value;
    });
  }

  late final _$_ProjectDetailViewModelBaseActionController =
      ActionController(name: '_ProjectDetailViewModelBase', context: context);

  @override
  void changeIndex(dynamic newIndex) {
    final _$actionInfo = _$_ProjectDetailViewModelBaseActionController
        .startAction(name: '_ProjectDetailViewModelBase.changeIndex');
    try {
      return super.changeIndex(newIndex);
    } finally {
      _$_ProjectDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePageSelector() {
    final _$actionInfo = _$_ProjectDetailViewModelBaseActionController
        .startAction(name: '_ProjectDetailViewModelBase.togglePageSelector');
    try {
      return super.togglePageSelector();
    } finally {
      _$_ProjectDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _getDetail() {
    final _$actionInfo = _$_ProjectDetailViewModelBaseActionController
        .startAction(name: '_ProjectDetailViewModelBase._getDetail');
    try {
      return super._getDetail();
    } finally {
      _$_ProjectDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
templateIndex: ${templateIndex},
entity: ${entity},
isPageSelectorVisible: ${isPageSelectorVisible}
    ''';
  }
}
