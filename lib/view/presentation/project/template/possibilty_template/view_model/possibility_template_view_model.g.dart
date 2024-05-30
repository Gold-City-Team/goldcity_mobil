// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'possibility_template_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PossibilityTemplateViewModel
    on _PossibilityTemplateViewModelBase, Store {
  late final _$templateThreeAtom = Atom(
      name: '_PossibilityTemplateViewModelBase.templateThree',
      context: context);

  @override
  TemplateThreeEntity? get templateThree {
    _$templateThreeAtom.reportRead();
    return super.templateThree;
  }

  @override
  set templateThree(TemplateThreeEntity? value) {
    _$templateThreeAtom.reportWrite(value, super.templateThree, () {
      super.templateThree = value;
    });
  }

  late final _$selectedPinIndexAtom = Atom(
      name: '_PossibilityTemplateViewModelBase.selectedPinIndex',
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
      '_PossibilityTemplateViewModelBase._getDetail',
      context: context);

  @override
  Future<void> _getDetail() {
    return _$_getDetailAsyncAction.run(() => super._getDetail());
  }

  late final _$_PossibilityTemplateViewModelBaseActionController =
      ActionController(
          name: '_PossibilityTemplateViewModelBase', context: context);

  @override
  void changeSelectedPinIndex(int newIndex) {
    final _$actionInfo =
        _$_PossibilityTemplateViewModelBaseActionController.startAction(
            name: '_PossibilityTemplateViewModelBase.changeSelectedPinIndex');
    try {
      return super.changeSelectedPinIndex(newIndex);
    } finally {
      _$_PossibilityTemplateViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
templateThree: ${templateThree},
selectedPinIndex: ${selectedPinIndex}
    ''';
  }
}
