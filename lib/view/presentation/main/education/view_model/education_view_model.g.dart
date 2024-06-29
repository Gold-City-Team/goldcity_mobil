// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EducationViewModel on _EducationViewModelBase, Store {
  late final _$modelAtom =
      Atom(name: '_EducationViewModelBase.model', context: context);

  @override
  List<EducationDetailEntity>? get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(List<EducationDetailEntity>? value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$_getEducationListAsyncAction = AsyncAction(
      '_EducationViewModelBase._getEducationList',
      context: context);

  @override
  Future<void> _getEducationList() {
    return _$_getEducationListAsyncAction.run(() => super._getEducationList());
  }

  @override
  String toString() {
    return '''
model: ${model}
    ''';
  }
}
