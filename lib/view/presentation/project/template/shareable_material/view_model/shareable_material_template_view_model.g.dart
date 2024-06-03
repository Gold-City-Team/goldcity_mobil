// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shareable_material_template_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ShareableMaterialTemplateViewModel
    on _ShareableMaterialTemplateViewModelBase, Store {
  late final _$templateAtom = Atom(
      name: '_ShareableMaterialTemplateViewModelBase.template',
      context: context);

  @override
  TemplateFiveEntity? get template {
    _$templateAtom.reportRead();
    return super.template;
  }

  @override
  set template(TemplateFiveEntity? value) {
    _$templateAtom.reportWrite(value, super.template, () {
      super.template = value;
    });
  }

  late final _$_getDetailAsyncAction = AsyncAction(
      '_ShareableMaterialTemplateViewModelBase._getDetail',
      context: context);

  @override
  Future<void> _getDetail() {
    return _$_getDetailAsyncAction.run(() => super._getDetail());
  }

  late final _$_ShareableMaterialTemplateViewModelBaseActionController =
      ActionController(
          name: '_ShareableMaterialTemplateViewModelBase', context: context);

  @override
  void toggleFullViewItemIndex(String item) {
    final _$actionInfo =
        _$_ShareableMaterialTemplateViewModelBaseActionController.startAction(
            name:
                '_ShareableMaterialTemplateViewModelBase.toggleFullViewItemIndex');
    try {
      return super.toggleFullViewItemIndex(item);
    } finally {
      _$_ShareableMaterialTemplateViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
template: ${template}
    ''';
  }
}
