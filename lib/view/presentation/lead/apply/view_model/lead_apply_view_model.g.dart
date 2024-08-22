// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lead_apply_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LeadApplyViewModel on _LeadApplyViewModelBase, Store {
  late final _$agreementAtom =
      Atom(name: '_LeadApplyViewModelBase.agreement', context: context);

  @override
  bool get agreement {
    _$agreementAtom.reportRead();
    return super.agreement;
  }

  @override
  set agreement(bool value) {
    _$agreementAtom.reportWrite(value, super.agreement, () {
      super.agreement = value;
    });
  }

  late final _$termAtom =
      Atom(name: '_LeadApplyViewModelBase.term', context: context);

  @override
  String get term {
    _$termAtom.reportRead();
    return super.term;
  }

  @override
  set term(String value) {
    _$termAtom.reportWrite(value, super.term, () {
      super.term = value;
    });
  }

  late final _$privacyAtom =
      Atom(name: '_LeadApplyViewModelBase.privacy', context: context);

  @override
  String get privacy {
    _$privacyAtom.reportRead();
    return super.privacy;
  }

  @override
  set privacy(String value) {
    _$privacyAtom.reportWrite(value, super.privacy, () {
      super.privacy = value;
    });
  }

  late final _$illuminationAtom =
      Atom(name: '_LeadApplyViewModelBase.illumination', context: context);

  @override
  String get illumination {
    _$illuminationAtom.reportRead();
    return super.illumination;
  }

  @override
  set illumination(String value) {
    _$illuminationAtom.reportWrite(value, super.illumination, () {
      super.illumination = value;
    });
  }

  late final _$imageAtom =
      Atom(name: '_LeadApplyViewModelBase.image', context: context);

  @override
  String get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(String value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$_getPolicyAsyncAction =
      AsyncAction('_LeadApplyViewModelBase._getPolicy', context: context);

  @override
  Future<void> _getPolicy() {
    return _$_getPolicyAsyncAction.run(() => super._getPolicy());
  }

  late final _$_getImageAsyncAction =
      AsyncAction('_LeadApplyViewModelBase._getImage', context: context);

  @override
  Future<void> _getImage() {
    return _$_getImageAsyncAction.run(() => super._getImage());
  }

  late final _$_LeadApplyViewModelBaseActionController =
      ActionController(name: '_LeadApplyViewModelBase', context: context);

  @override
  void changeAgreement() {
    final _$actionInfo = _$_LeadApplyViewModelBaseActionController.startAction(
        name: '_LeadApplyViewModelBase.changeAgreement');
    try {
      return super.changeAgreement();
    } finally {
      _$_LeadApplyViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
agreement: ${agreement},
term: ${term},
privacy: ${privacy},
illumination: ${illumination},
image: ${image}
    ''';
  }
}
