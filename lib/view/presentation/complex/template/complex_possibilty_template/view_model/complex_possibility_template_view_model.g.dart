// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complex_possibility_template_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ComplexPossibilityTemplateViewModel
    on _ComplexPossibilityTemplateViewModelBase, Store {
  late final _$templateThreeAtom = Atom(
      name: '_ComplexPossibilityTemplateViewModelBase.templateThree',
      context: context);

  @override
  ComplexTemplateThreeEntity? get templateThree {
    _$templateThreeAtom.reportRead();
    return super.templateThree;
  }

  @override
  set templateThree(ComplexTemplateThreeEntity? value) {
    _$templateThreeAtom.reportWrite(value, super.templateThree, () {
      super.templateThree = value;
    });
  }

  late final _$selectedPinIndexAtom = Atom(
      name: '_ComplexPossibilityTemplateViewModelBase.selectedPinIndex',
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
      '_ComplexPossibilityTemplateViewModelBase._getDetail',
      context: context);

  @override
  Future<void> _getDetail() {
    return _$_getDetailAsyncAction.run(() => super._getDetail());
  }

  late final _$_ComplexPossibilityTemplateViewModelBaseActionController =
      ActionController(
          name: '_ComplexPossibilityTemplateViewModelBase', context: context);

  @override
  void changeSelectedPinIndex(int newIndex) {
    final _$actionInfo =
        _$_ComplexPossibilityTemplateViewModelBaseActionController.startAction(
            name:
                '_ComplexPossibilityTemplateViewModelBase.changeSelectedPinIndex');
    try {
      return super.changeSelectedPinIndex(newIndex);
    } finally {
      _$_ComplexPossibilityTemplateViewModelBaseActionController
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
