// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EducationDetailViewModel on _EducationDetailViewModelBase, Store {
  late final _$educationEntityAtom = Atom(
      name: '_EducationDetailViewModelBase.educationEntity', context: context);

  @override
  EducationEntity? get educationEntity {
    _$educationEntityAtom.reportRead();
    return super.educationEntity;
  }

  @override
  set educationEntity(EducationEntity? value) {
    _$educationEntityAtom.reportWrite(value, super.educationEntity, () {
      super.educationEntity = value;
    });
  }

  late final _$_getDataAsyncAction =
      AsyncAction('_EducationDetailViewModelBase._getData', context: context);

  @override
  Future<void> _getData() {
    return _$_getDataAsyncAction.run(() => super._getData());
  }

  @override
  String toString() {
    return '''
educationEntity: ${educationEntity}
    ''';
  }
}
