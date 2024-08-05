// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AnnouncementViewModel on _AnnouncementViewModelBase, Store {
  late final _$entityAtom =
      Atom(name: '_AnnouncementViewModelBase.entity', context: context);

  @override
  List<AnnouncementEntity>? get entity {
    _$entityAtom.reportRead();
    return super.entity;
  }

  @override
  set entity(List<AnnouncementEntity>? value) {
    _$entityAtom.reportWrite(value, super.entity, () {
      super.entity = value;
    });
  }

  late final _$detailAtom =
      Atom(name: '_AnnouncementViewModelBase.detail', context: context);

  @override
  AnnouncementEntity? get detail {
    _$detailAtom.reportRead();
    return super.detail;
  }

  @override
  set detail(AnnouncementEntity? value) {
    _$detailAtom.reportWrite(value, super.detail, () {
      super.detail = value;
    });
  }

  late final _$selectedIndexAtom =
      Atom(name: '_AnnouncementViewModelBase.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$showDetailAtom =
      Atom(name: '_AnnouncementViewModelBase.showDetail', context: context);

  @override
  bool get showDetail {
    _$showDetailAtom.reportRead();
    return super.showDetail;
  }

  @override
  set showDetail(bool value) {
    _$showDetailAtom.reportWrite(value, super.showDetail, () {
      super.showDetail = value;
    });
  }

  late final _$entitySearchAtom =
      Atom(name: '_AnnouncementViewModelBase.entitySearch', context: context);

  @override
  List<AnnouncementEntity>? get entitySearch {
    _$entitySearchAtom.reportRead();
    return super.entitySearch;
  }

  @override
  set entitySearch(List<AnnouncementEntity>? value) {
    _$entitySearchAtom.reportWrite(value, super.entitySearch, () {
      super.entitySearch = value;
    });
  }

  late final _$_getDataDetailAsyncAction = AsyncAction(
      '_AnnouncementViewModelBase._getDataDetail',
      context: context);

  @override
  Future<void> _getDataDetail() {
    return _$_getDataDetailAsyncAction.run(() => super._getDataDetail());
  }

  late final _$_getDataAsyncAction =
      AsyncAction('_AnnouncementViewModelBase._getData', context: context);

  @override
  Future<void> _getData() {
    return _$_getDataAsyncAction.run(() => super._getData());
  }

  late final _$searchAsyncAction =
      AsyncAction('_AnnouncementViewModelBase.search', context: context);

  @override
  Future<void> search(String search) {
    return _$searchAsyncAction.run(() => super.search(search));
  }

  late final _$_AnnouncementViewModelBaseActionController =
      ActionController(name: '_AnnouncementViewModelBase', context: context);

  @override
  void changeSelectedIndex(int value) {
    final _$actionInfo = _$_AnnouncementViewModelBaseActionController
        .startAction(name: '_AnnouncementViewModelBase.changeSelectedIndex');
    try {
      return super.changeSelectedIndex(value);
    } finally {
      _$_AnnouncementViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleShowDetail() {
    final _$actionInfo = _$_AnnouncementViewModelBaseActionController
        .startAction(name: '_AnnouncementViewModelBase.toggleShowDetail');
    try {
      return super.toggleShowDetail();
    } finally {
      _$_AnnouncementViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
entity: ${entity},
detail: ${detail},
selectedIndex: ${selectedIndex},
showDetail: ${showDetail},
entitySearch: ${entitySearch}
    ''';
  }
}
