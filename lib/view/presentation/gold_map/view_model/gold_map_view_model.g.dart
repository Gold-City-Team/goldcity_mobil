// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gold_map_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GoldMapViewModel on _GoldMapViewModelBase, Store {
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

  @override
  String toString() {
    return '''
projectPossibilityEntity: ${projectPossibilityEntity}
    ''';
  }
}
