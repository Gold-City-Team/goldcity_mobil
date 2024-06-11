// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ComplexDetailViewModel on _ComplexDetailViewModelBase, Store {
  late final _$templateIndexAtom =
      Atom(name: '_ComplexDetailViewModelBase.templateIndex', context: context);

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
      Atom(name: '_ComplexDetailViewModelBase.entity', context: context);

  @override
  ComplexEntity? get entity {
    _$entityAtom.reportRead();
    return super.entity;
  }

  @override
  set entity(ComplexEntity? value) {
    _$entityAtom.reportWrite(value, super.entity, () {
      super.entity = value;
    });
  }

  late final _$isPageSelectorVisibleAtom = Atom(
      name: '_ComplexDetailViewModelBase.isPageSelectorVisible',
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

  late final _$_getDetailAsyncAction =
      AsyncAction('_ComplexDetailViewModelBase._getDetail', context: context);

  @override
  Future<void> _getDetail() {
    return _$_getDetailAsyncAction.run(() => super._getDetail());
  }

  late final _$_ComplexDetailViewModelBaseActionController =
      ActionController(name: '_ComplexDetailViewModelBase', context: context);

  @override
  void changeIndex(dynamic newIndex) {
    final _$actionInfo = _$_ComplexDetailViewModelBaseActionController
        .startAction(name: '_ComplexDetailViewModelBase.changeIndex');
    try {
      return super.changeIndex(newIndex);
    } finally {
      _$_ComplexDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePageSelector() {
    final _$actionInfo = _$_ComplexDetailViewModelBaseActionController
        .startAction(name: '_ComplexDetailViewModelBase.togglePageSelector');
    try {
      return super.togglePageSelector();
    } finally {
      _$_ComplexDetailViewModelBaseActionController.endAction(_$actionInfo);
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
