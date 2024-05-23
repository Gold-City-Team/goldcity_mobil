// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'future_template_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FutureTemplateViewModel on _FutureTemplateViewModelBase, Store {
  late final _$projectEntityAtom = Atom(
      name: '_FutureTemplateViewModelBase.projectEntity', context: context);

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

  late final _$_getProjectDetailAsyncAction = AsyncAction(
      '_FutureTemplateViewModelBase._getProjectDetail',
      context: context);

  @override
  Future<void> _getProjectDetail() {
    return _$_getProjectDetailAsyncAction.run(() => super._getProjectDetail());
  }

  @override
  String toString() {
    return '''
projectEntity: ${projectEntity}
    ''';
  }
}
