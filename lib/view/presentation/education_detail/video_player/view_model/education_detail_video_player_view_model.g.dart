// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_detail_video_player_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EducationDetailVideoPlayerViewModel
    on _EducationDetailVideoPlayerViewModelBase, Store {
  late final _$videoLinkAtom = Atom(
      name: '_EducationDetailVideoPlayerViewModelBase.videoLink',
      context: context);

  @override
  String get videoLink {
    _$videoLinkAtom.reportRead();
    return super.videoLink;
  }

  @override
  set videoLink(String value) {
    _$videoLinkAtom.reportWrite(value, super.videoLink, () {
      super.videoLink = value;
    });
  }

  late final _$_getVideoLinkAsyncAction = AsyncAction(
      '_EducationDetailVideoPlayerViewModelBase._getVideoLink',
      context: context);

  @override
  Future<void> _getVideoLink() {
    return _$_getVideoLinkAsyncAction.run(() => super._getVideoLink());
  }

  @override
  String toString() {
    return '''
videoLink: ${videoLink}
    ''';
  }
}
