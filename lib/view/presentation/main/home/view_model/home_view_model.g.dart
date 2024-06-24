// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$pageListAtom =
      Atom(name: '_HomeViewModelBase.pageList', context: context);

  @override
  ObservableList<Widget> get pageList {
    _$pageListAtom.reportRead();
    return super.pageList;
  }

  @override
  set pageList(ObservableList<Widget> value) {
    _$pageListAtom.reportWrite(value, super.pageList, () {
      super.pageList = value;
    });
  }

  late final _$pageIndexAtom =
      Atom(name: '_HomeViewModelBase.pageIndex', context: context);

  @override
  int get pageIndex {
    _$pageIndexAtom.reportRead();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.reportWrite(value, super.pageIndex, () {
      super.pageIndex = value;
    });
  }

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

  late final _$isPageSelectorVisibleAtom =
      Atom(name: '_HomeViewModelBase.isPageSelectorVisible', context: context);

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

  late final _$complexListAtom =
      Atom(name: '_HomeViewModelBase.complexList', context: context);

  @override
  List<ComplexEntity>? get complexList {
    _$complexListAtom.reportRead();
    return super.complexList;
  }

  @override
  set complexList(List<ComplexEntity>? value) {
    _$complexListAtom.reportWrite(value, super.complexList, () {
      super.complexList = value;
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
  void togglePageSelector() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.togglePageSelector');
    try {
      return super.togglePageSelector();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _getComplexList() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase._getComplexList');
    try {
      return super._getComplexList();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIndex(dynamic newIndex) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.changeIndex');
    try {
      return super.changeIndex(newIndex);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageList: ${pageList},
pageIndex: ${pageIndex},
projectList: ${projectList},
isPageSelectorVisible: ${isPageSelectorVisible},
complexList: ${complexList}
    ''';
  }
}
