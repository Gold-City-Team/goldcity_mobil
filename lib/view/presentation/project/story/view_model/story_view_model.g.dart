// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoryViewModel on _StoryViewModelBase, Store {
  late final _$storyListAtom =
      Atom(name: '_StoryViewModelBase.storyList', context: context);

  @override
  List<String> get storyList {
    _$storyListAtom.reportRead();
    return super.storyList;
  }

  @override
  set storyList(List<String> value) {
    _$storyListAtom.reportWrite(value, super.storyList, () {
      super.storyList = value;
    });
  }

  late final _$indexAtom =
      Atom(name: '_StoryViewModelBase.index', context: context);

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$_getSourceAsyncAction =
      AsyncAction('_StoryViewModelBase._getSource', context: context);

  @override
  Future<void> _getSource() {
    return _$_getSourceAsyncAction.run(() => super._getSource());
  }

  late final _$_StoryViewModelBaseActionController =
      ActionController(name: '_StoryViewModelBase', context: context);

  @override
  void previusStory() {
    final _$actionInfo = _$_StoryViewModelBaseActionController.startAction(
        name: '_StoryViewModelBase.previusStory');
    try {
      return super.previusStory();
    } finally {
      _$_StoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextStory() {
    final _$actionInfo = _$_StoryViewModelBaseActionController.startAction(
        name: '_StoryViewModelBase.nextStory');
    try {
      return super.nextStory();
    } finally {
      _$_StoryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
storyList: ${storyList},
index: ${index}
    ''';
  }
}
