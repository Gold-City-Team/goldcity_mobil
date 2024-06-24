// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex_double_gallery_template_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ComplexDoubleGalleryTemplateViewModel
    on _ComplexDoubleGalleryTemplateViewModelBase, Store {
  late final _$templateEntityAtom = Atom(
      name: '_ComplexDoubleGalleryTemplateViewModelBase.templateEntity',
      context: context);

  @override
  ComplexTemplateTwoEntity? get templateEntity {
    _$templateEntityAtom.reportRead();
    return super.templateEntity;
  }

  @override
  set templateEntity(ComplexTemplateTwoEntity? value) {
    _$templateEntityAtom.reportWrite(value, super.templateEntity, () {
      super.templateEntity = value;
    });
  }

  late final _$_getDetailAsyncAction = AsyncAction(
      '_ComplexDoubleGalleryTemplateViewModelBase._getDetail',
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
