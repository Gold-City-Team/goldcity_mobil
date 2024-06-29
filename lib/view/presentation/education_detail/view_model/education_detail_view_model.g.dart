// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EducationDetailViewModel on _EducationDetailViewModelBase, Store {
  late final _$modelAtom =
      Atom(name: '_EducationDetailViewModelBase.model', context: context);

  @override
  EducationDetailEntity? get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(EducationDetailEntity? value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$modelUserEducationAtom = Atom(
      name: '_EducationDetailViewModelBase.modelUserEducation',
      context: context);

  @override
  UserEducationEntity? get modelUserEducation {
    _$modelUserEducationAtom.reportRead();
    return super.modelUserEducation;
  }

  @override
  set modelUserEducation(UserEducationEntity? value) {
    _$modelUserEducationAtom.reportWrite(value, super.modelUserEducation, () {
      super.modelUserEducation = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_EducationDetailViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$_getDetailAsyncAction =
      AsyncAction('_EducationDetailViewModelBase._getDetail', context: context);

  @override
  Future<void> _getDetail() {
    return _$_getDetailAsyncAction.run(() => super._getDetail());
  }

  @override
  String toString() {
    return '''
model: ${model},
modelUserEducation: ${modelUserEducation},
isLoading: ${isLoading}
    ''';
  }
}
