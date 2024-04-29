// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GalleryViewModel on _GalleryViewModelBase, Store {
  late final _$projectGalleryAtom =
      Atom(name: '_GalleryViewModelBase.projectGallery', context: context);

  @override
  ProjectGalleryEntity? get projectGallery {
    _$projectGalleryAtom.reportRead();
    return super.projectGallery;
  }

  @override
  set projectGallery(ProjectGalleryEntity? value) {
    _$projectGalleryAtom.reportWrite(value, super.projectGallery, () {
      super.projectGallery = value;
    });
  }

  late final _$isFullScreenAtom =
      Atom(name: '_GalleryViewModelBase.isFullScreen', context: context);

  @override
  bool get isFullScreen {
    _$isFullScreenAtom.reportRead();
    return super.isFullScreen;
  }

  @override
  set isFullScreen(bool value) {
    _$isFullScreenAtom.reportWrite(value, super.isFullScreen, () {
      super.isFullScreen = value;
    });
  }

  late final _$_GalleryViewModelBaseActionController =
      ActionController(name: '_GalleryViewModelBase', context: context);

  @override
  void getGallery() {
    final _$actionInfo = _$_GalleryViewModelBaseActionController.startAction(
        name: '_GalleryViewModelBase.getGallery');
    try {
      return super.getGallery();
    } finally {
      _$_GalleryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleFullScreen() {
    final _$actionInfo = _$_GalleryViewModelBaseActionController.startAction(
        name: '_GalleryViewModelBase.toggleFullScreen');
    try {
      return super.toggleFullScreen();
    } finally {
      _$_GalleryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
projectGallery: ${projectGallery},
isFullScreen: ${isFullScreen}
    ''';
  }
}
