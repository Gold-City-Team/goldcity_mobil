// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex_gallery_and_info_template_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ComplexGalleryAndInfoTemplateViewModel
    on _ComplexGalleryAndInfoTemplateViewModelBase, Store {
  late final _$templateTwoAtom = Atom(
      name: '_ComplexGalleryAndInfoTemplateViewModelBase.templateTwo',
      context: context);

  @override
  ComplexTemplateTwoEntity? get templateTwo {
    _$templateTwoAtom.reportRead();
    return super.templateTwo;
  }

  @override
  set templateTwo(ComplexTemplateTwoEntity? value) {
    _$templateTwoAtom.reportWrite(value, super.templateTwo, () {
      super.templateTwo = value;
    });
  }

  late final _$_getDetailAsyncAction = AsyncAction(
      '_ComplexGalleryAndInfoTemplateViewModelBase._getDetail',
      context: context);

  @override
  Future<void> _getDetail() {
    return _$_getDetailAsyncAction.run(() => super._getDetail());
  }

  @override
  String toString() {
    return '''
templateTwo: ${templateTwo}
    ''';
  }
}
