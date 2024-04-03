// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProjectDetailViewModel on _ProjectDetailViewModelBase, Store {
  late final _$projectEntityAtom =
      Atom(name: '_ProjectDetailViewModelBase.projectEntity', context: context);

  @override
  ProjectEntity? get projectEntity {
    _$projectEntityAtom.reportRead();
    return super.projectEntity;
  }

  @override
  set projectEntity(ProjectEntity? value) {
    _$projectEntityAtom.reportWrite(value, super.projectEntity, () {
      super.projectEntity = value;
    });
  }

  late final _$getProjectDetailAsyncAction = AsyncAction(
      '_ProjectDetailViewModelBase.getProjectDetail',
      context: context);

  @override
  Future<void> getProjectDetail() {
    return _$getProjectDetailAsyncAction.run(() => super.getProjectDetail());
  }

  @override
  String toString() {
    return '''
projectEntity: ${projectEntity}
    ''';
  }
}
