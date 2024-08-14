// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_possibility_template_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProjectPossibilityTemplateViewModel
    on _ProjectPossibilityTemplateViewModelBase, Store {
  late final _$templateThreeAtom = Atom(
      name: '_ProjectPossibilityTemplateViewModelBase.templateThree',
      context: context);

  @override
  ProjectTemplateThreeEntity? get templateThree {
    _$templateThreeAtom.reportRead();
    return super.templateThree;
  }

  @override
  set templateThree(ProjectTemplateThreeEntity? value) {
    _$templateThreeAtom.reportWrite(value, super.templateThree, () {
      super.templateThree = value;
    });
  }

  late final _$possibilitiesWithFilterAtom = Atom(
      name: '_ProjectPossibilityTemplateViewModelBase.possibilitiesWithFilter',
      context: context);

  @override
  List<PossibilityEntity> get possibilitiesWithFilter {
    _$possibilitiesWithFilterAtom.reportRead();
    return super.possibilitiesWithFilter;
  }

  @override
  set possibilitiesWithFilter(List<PossibilityEntity> value) {
    _$possibilitiesWithFilterAtom
        .reportWrite(value, super.possibilitiesWithFilter, () {
      super.possibilitiesWithFilter = value;
    });
  }

  late final _$selectedCategoryIndexAtom = Atom(
      name: '_ProjectPossibilityTemplateViewModelBase.selectedCategoryIndex',
      context: context);

  @override
  int get selectedCategoryIndex {
    _$selectedCategoryIndexAtom.reportRead();
    return super.selectedCategoryIndex;
  }

  @override
  set selectedCategoryIndex(int value) {
    _$selectedCategoryIndexAtom.reportWrite(value, super.selectedCategoryIndex,
        () {
      super.selectedCategoryIndex = value;
    });
  }

  late final _$selectedPinIndexAtom = Atom(
      name: '_ProjectPossibilityTemplateViewModelBase.selectedPinIndex',
      context: context);

  @override
  int get selectedPinIndex {
    _$selectedPinIndexAtom.reportRead();
    return super.selectedPinIndex;
  }

  @override
  set selectedPinIndex(int value) {
    _$selectedPinIndexAtom.reportWrite(value, super.selectedPinIndex, () {
      super.selectedPinIndex = value;
    });
  }

  late final _$_getDetailAsyncAction = AsyncAction(
      '_ProjectPossibilityTemplateViewModelBase._getDetail',
      context: context);

  @override
  Future<void> _getDetail() {
    return _$_getDetailAsyncAction.run(() => super._getDetail());
  }

  late final _$_ProjectPossibilityTemplateViewModelBaseActionController =
      ActionController(
          name: '_ProjectPossibilityTemplateViewModelBase', context: context);

  @override
  dynamic _getCategoryList() {
    final _$actionInfo =
        _$_ProjectPossibilityTemplateViewModelBaseActionController.startAction(
            name: '_ProjectPossibilityTemplateViewModelBase._getCategoryList');
    try {
      return super._getCategoryList();
    } finally {
      _$_ProjectPossibilityTemplateViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCagetory(int index) {
    final _$actionInfo =
        _$_ProjectPossibilityTemplateViewModelBaseActionController.startAction(
            name: '_ProjectPossibilityTemplateViewModelBase.changeCagetory');
    try {
      return super.changeCagetory(index);
    } finally {
      _$_ProjectPossibilityTemplateViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeSelectedPinIndex(int newIndex) {
    final _$actionInfo =
        _$_ProjectPossibilityTemplateViewModelBaseActionController.startAction(
            name:
                '_ProjectPossibilityTemplateViewModelBase.changeSelectedPinIndex');
    try {
      return super.changeSelectedPinIndex(newIndex);
    } finally {
      _$_ProjectPossibilityTemplateViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
templateThree: ${templateThree},
possibilitiesWithFilter: ${possibilitiesWithFilter},
selectedCategoryIndex: ${selectedCategoryIndex},
selectedPinIndex: ${selectedPinIndex}
    ''';
  }
}
