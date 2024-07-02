// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_template_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlanTemplateViewModel on _PlanTemplateViewModelBase, Store {
  late final _$templateAtom =
      Atom(name: '_PlanTemplateViewModelBase.template', context: context);

  @override
  ProjectTemplateSixEntity? get template {
    _$templateAtom.reportRead();
    return super.template;
  }

  @override
  set template(ProjectTemplateSixEntity? value) {
    _$templateAtom.reportWrite(value, super.template, () {
      super.template = value;
    });
  }

  late final _$_PlanTemplateViewModelBaseActionController =
      ActionController(name: '_PlanTemplateViewModelBase', context: context);

  @override
  void toggleFullViewItemIndex(String item) {
    final _$actionInfo =
        _$_PlanTemplateViewModelBaseActionController.startAction(
            name: '_PlanTemplateViewModelBase.toggleFullViewItemIndex');
    try {
      return super.toggleFullViewItemIndex(item);
    } finally {
      _$_PlanTemplateViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
template: ${template}
    ''';
  }
}
