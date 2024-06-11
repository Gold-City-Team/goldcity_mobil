// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex_feature_template_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ComplexFeatureTemplateViewModel
    on _ComplexFeatureTemplateViewModelBase, Store {
  late final _$templateEntityAtom = Atom(
      name: '_ComplexFeatureTemplateViewModelBase.templateEntity',
      context: context);

  @override
  ComplexTemplateOneEntity? get templateEntity {
    _$templateEntityAtom.reportRead();
    return super.templateEntity;
  }

  @override
  set templateEntity(ComplexTemplateOneEntity? value) {
    _$templateEntityAtom.reportWrite(value, super.templateEntity, () {
      super.templateEntity = value;
    });
  }

  late final _$_getDetailAsyncAction = AsyncAction(
      '_ComplexFeatureTemplateViewModelBase._getDetail',
      context: context);

  @override
  Future<void> _getDetail() {
    return _$_getDetailAsyncAction.run(() => super._getDetail());
  }

  @override
  String toString() {
    return '''
templateEntity: ${templateEntity}
    ''';
  }
}
