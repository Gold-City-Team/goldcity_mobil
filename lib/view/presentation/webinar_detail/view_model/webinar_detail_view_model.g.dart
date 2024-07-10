// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webinar_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WebinarDetailViewModel on _WebinarDetailViewModelBase, Store {
  late final _$modelAtom =
      Atom(name: '_WebinarDetailViewModelBase.model', context: context);

  @override
  WebinarDetailEntity? get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(WebinarDetailEntity? value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  late final _$modelUserEducationAtom = Atom(
      name: '_WebinarDetailViewModelBase.modelUserEducation', context: context);

  @override
  UserWebinarEntity? get modelUserEducation {
    _$modelUserEducationAtom.reportRead();
    return super.modelUserEducation;
  }

  @override
  set modelUserEducation(UserWebinarEntity? value) {
    _$modelUserEducationAtom.reportWrite(value, super.modelUserEducation, () {
      super.modelUserEducation = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_WebinarDetailViewModelBase.isLoading', context: context);

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
      AsyncAction('_WebinarDetailViewModelBase._getDetail', context: context);

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
