// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsViewModel on _SettingsViewModelBase, Store {
  late final _$termAtom =
      Atom(name: '_SettingsViewModelBase.term', context: context);

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
      Atom(name: '_SettingsViewModelBase.privacy', context: context);

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
      Atom(name: '_SettingsViewModelBase.illumination', context: context);

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

  late final _$_getPolicyAsyncAction =
      AsyncAction('_SettingsViewModelBase._getPolicy', context: context);

  @override
  Future<void> _getPolicy() {
    return _$_getPolicyAsyncAction.run(() => super._getPolicy());
  }

  late final _$_getContactAsyncAction =
      AsyncAction('_SettingsViewModelBase._getContact', context: context);

  @override
  Future<void> _getContact() {
    return _$_getContactAsyncAction.run(() => super._getContact());
  }

  @override
  String toString() {
    return '''
term: ${term},
privacy: ${privacy},
illumination: ${illumination}
    ''';
  }
}
