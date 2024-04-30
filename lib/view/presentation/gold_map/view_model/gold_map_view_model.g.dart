// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gold_map_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GoldMapViewModel on _GoldMapViewModelBase, Store {
  late final _$selectedIndexAtom =
      Atom(name: '_GoldMapViewModelBase.selectedIndex', context: context);

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

  late final _$projectPossibilityEntityAtom = Atom(
      name: '_GoldMapViewModelBase.projectPossibilityEntity', context: context);

  @override
  ProjectPossibilityEntity? get projectPossibilityEntity {
    _$projectPossibilityEntityAtom.reportRead();
    return super.projectPossibilityEntity;
  }

  @override
  set projectPossibilityEntity(ProjectPossibilityEntity? value) {
    _$projectPossibilityEntityAtom
        .reportWrite(value, super.projectPossibilityEntity, () {
      super.projectPossibilityEntity = value;
    });
  }

  late final _$getPossibilitiesAsyncAction =
      AsyncAction('_GoldMapViewModelBase.getPossibilities', context: context);

  @override
  Future<void> getPossibilities() {
    return _$getPossibilitiesAsyncAction.run(() => super.getPossibilities());
  }

  late final _$_GoldMapViewModelBaseActionController =
      ActionController(name: '_GoldMapViewModelBase', context: context);

  @override
  void changeSelectedIndex(int index) {
    final _$actionInfo = _$_GoldMapViewModelBaseActionController.startAction(
        name: '_GoldMapViewModelBase.changeSelectedIndex');
    try {
      return super.changeSelectedIndex(index);
    } finally {
      _$_GoldMapViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex},
projectPossibilityEntity: ${projectPossibilityEntity}
    ''';
  }
}
