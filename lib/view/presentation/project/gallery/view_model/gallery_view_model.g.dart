// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GalleryViewModel on _GalleryViewModelBase, Store {
  late final _$selectedMediaIndexAtom =
      Atom(name: '_GalleryViewModelBase.selectedMediaIndex', context: context);

  @override
  int get selectedMediaIndex {
    _$selectedMediaIndexAtom.reportRead();
    return super.selectedMediaIndex;
  }

  @override
  set selectedMediaIndex(int value) {
    _$selectedMediaIndexAtom.reportWrite(value, super.selectedMediaIndex, () {
      super.selectedMediaIndex = value;
    });
  }

  late final _$isBottomVisibleAtom =
      Atom(name: '_GalleryViewModelBase.isBottomVisible', context: context);

  @override
  bool get isBottomVisible {
    _$isBottomVisibleAtom.reportRead();
    return super.isBottomVisible;
  }

  @override
  set isBottomVisible(bool value) {
    _$isBottomVisibleAtom.reportWrite(value, super.isBottomVisible, () {
      super.isBottomVisible = value;
    });
  }

  late final _$_GalleryViewModelBaseActionController =
      ActionController(name: '_GalleryViewModelBase', context: context);

  @override
  void selectedMediaIndexChange(int newIndex) {
    final _$actionInfo = _$_GalleryViewModelBaseActionController.startAction(
        name: '_GalleryViewModelBase.selectedMediaIndexChange');
    try {
      return super.selectedMediaIndexChange(newIndex);
    } finally {
      _$_GalleryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleBottomVisible() {
    final _$actionInfo = _$_GalleryViewModelBaseActionController.startAction(
        name: '_GalleryViewModelBase.toggleBottomVisible');
    try {
      return super.toggleBottomVisible();
    } finally {
      _$_GalleryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _configureGallery() {
    final _$actionInfo = _$_GalleryViewModelBaseActionController.startAction(
        name: '_GalleryViewModelBase._configureGallery');
    try {
      return super._configureGallery();
    } finally {
      _$_GalleryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedMediaIndex: ${selectedMediaIndex},
isBottomVisible: ${isBottomVisible}
    ''';
  }
}
