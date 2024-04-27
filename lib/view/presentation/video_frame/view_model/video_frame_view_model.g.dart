// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_frame_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VideoFrameViewModel on _VideoFrameViewModelBase, Store {
  late final _$isPlayingAtom =
      Atom(name: '_VideoFrameViewModelBase.isPlaying', context: context);

  @override
  bool get isPlaying {
    _$isPlayingAtom.reportRead();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.reportWrite(value, super.isPlaying, () {
      super.isPlaying = value;
    });
  }

  late final _$positionAtom =
      Atom(name: '_VideoFrameViewModelBase.position', context: context);

  @override
  double get position {
    _$positionAtom.reportRead();
    return super.position;
  }

  @override
  set position(double value) {
    _$positionAtom.reportWrite(value, super.position, () {
      super.position = value;
    });
  }

  late final _$oldPositionAtom =
      Atom(name: '_VideoFrameViewModelBase.oldPosition', context: context);

  @override
  double get oldPosition {
    _$oldPositionAtom.reportRead();
    return super.oldPosition;
  }

  @override
  set oldPosition(double value) {
    _$oldPositionAtom.reportWrite(value, super.oldPosition, () {
      super.oldPosition = value;
    });
  }

  late final _$isOpacityFullAtom =
      Atom(name: '_VideoFrameViewModelBase.isOpacityFull', context: context);

  @override
  bool get isOpacityFull {
    _$isOpacityFullAtom.reportRead();
    return super.isOpacityFull;
  }

  @override
  set isOpacityFull(bool value) {
    _$isOpacityFullAtom.reportWrite(value, super.isOpacityFull, () {
      super.isOpacityFull = value;
    });
  }

  late final _$_VideoFrameViewModelBaseActionController =
      ActionController(name: '_VideoFrameViewModelBase', context: context);

  @override
  void init() {
    final _$actionInfo = _$_VideoFrameViewModelBaseActionController.startAction(
        name: '_VideoFrameViewModelBase.init');
    try {
      return super.init();
    } finally {
      _$_VideoFrameViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleVideo() {
    final _$actionInfo = _$_VideoFrameViewModelBaseActionController.startAction(
        name: '_VideoFrameViewModelBase.toggleVideo');
    try {
      return super.toggleVideo();
    } finally {
      _$_VideoFrameViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void positionUpdater() {
    final _$actionInfo = _$_VideoFrameViewModelBaseActionController.startAction(
        name: '_VideoFrameViewModelBase.positionUpdater');
    try {
      return super.positionUpdater();
    } finally {
      _$_VideoFrameViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onChangeEnd(double lastPosition) {
    final _$actionInfo = _$_VideoFrameViewModelBaseActionController.startAction(
        name: '_VideoFrameViewModelBase.onChangeEnd');
    try {
      return super.onChangeEnd(lastPosition);
    } finally {
      _$_VideoFrameViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onChanging(double value) {
    final _$actionInfo = _$_VideoFrameViewModelBaseActionController.startAction(
        name: '_VideoFrameViewModelBase.onChanging');
    try {
      return super.onChanging(value);
    } finally {
      _$_VideoFrameViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _autoToggleOpacity() {
    final _$actionInfo = _$_VideoFrameViewModelBaseActionController.startAction(
        name: '_VideoFrameViewModelBase._autoToggleOpacity');
    try {
      return super._autoToggleOpacity();
    } finally {
      _$_VideoFrameViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleOpacity() {
    final _$actionInfo = _$_VideoFrameViewModelBaseActionController.startAction(
        name: '_VideoFrameViewModelBase.toggleOpacity');
    try {
      return super.toggleOpacity();
    } finally {
      _$_VideoFrameViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onChangeStart() {
    final _$actionInfo = _$_VideoFrameViewModelBaseActionController.startAction(
        name: '_VideoFrameViewModelBase.onChangeStart');
    try {
      return super.onChangeStart();
    } finally {
      _$_VideoFrameViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPlaying: ${isPlaying},
position: ${position},
oldPosition: ${oldPosition},
isOpacityFull: ${isOpacityFull}
    ''';
  }
}
