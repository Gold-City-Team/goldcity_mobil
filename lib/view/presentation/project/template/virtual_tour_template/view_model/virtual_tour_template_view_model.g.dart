// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'virtual_tour_template_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VirtualTourTemplateViewModel
    on _VirtualTourTemplateViewModelBase, Store {
  late final _$templateAtom = Atom(
      name: '_VirtualTourTemplateViewModelBase.template', context: context);

  @override
  TemplateSevenEntity? get template {
    _$templateAtom.reportRead();
    return super.template;
  }

  @override
  set template(TemplateSevenEntity? value) {
    _$templateAtom.reportWrite(value, super.template, () {
      super.template = value;
    });
  }

  late final _$_getDetailAsyncAction = AsyncAction(
      '_VirtualTourTemplateViewModelBase._getDetail',
      context: context);

  @override
  Future<void> _getDetail() {
    return _$_getDetailAsyncAction.run(() => super._getDetail());
  }

  @override
  String toString() {
    return '''
template: ${template}
    ''';
  }
}
