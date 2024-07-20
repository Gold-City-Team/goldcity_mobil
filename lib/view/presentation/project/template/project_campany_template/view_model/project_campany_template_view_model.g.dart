// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_campany_template_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProjectCampanyTemplateViewModel
    on _ProjectCampanyTemplateViewModelBase, Store {
  late final _$templateNineAtom = Atom(
      name: '_ProjectCampanyTemplateViewModelBase.templateNine',
      context: context);

  @override
  ProjectTemplateNineEntity? get templateNine {
    _$templateNineAtom.reportRead();
    return super.templateNine;
  }

  @override
  set templateNine(ProjectTemplateNineEntity? value) {
    _$templateNineAtom.reportWrite(value, super.templateNine, () {
      super.templateNine = value;
    });
  }

  late final _$selectedIndexAtom = Atom(
      name: '_ProjectCampanyTemplateViewModelBase.selectedIndex',
      context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$_getDetailAsyncAction = AsyncAction(
      '_ProjectCampanyTemplateViewModelBase._getDetail',
      context: context);

  @override
  Future<void> _getDetail() {
    return _$_getDetailAsyncAction.run(() => super._getDetail());
  }

  late final _$_ProjectCampanyTemplateViewModelBaseActionController =
      ActionController(
          name: '_ProjectCampanyTemplateViewModelBase', context: context);

  @override
  void changeSelectedIndex(int index) {
    final _$actionInfo =
        _$_ProjectCampanyTemplateViewModelBaseActionController.startAction(
            name: '_ProjectCampanyTemplateViewModelBase.changeSelectedIndex');
    try {
      return super.changeSelectedIndex(index);
    } finally {
      _$_ProjectCampanyTemplateViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
templateNine: ${templateNine},
selectedIndex: ${selectedIndex}
    ''';
  }
}
