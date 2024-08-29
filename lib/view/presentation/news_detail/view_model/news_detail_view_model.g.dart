// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewsDetailViewModel on _NewsDetailViewModelBase, Store {
  late final _$entityAtom =
      Atom(name: '_NewsDetailViewModelBase.entity', context: context);

  @override
  NewsEntity? get entity {
    _$entityAtom.reportRead();
    return super.entity;
  }

  @override
  set entity(NewsEntity? value) {
    _$entityAtom.reportWrite(value, super.entity, () {
      super.entity = value;
    });
  }

  late final _$commentListAtom =
      Atom(name: '_NewsDetailViewModelBase.commentList', context: context);

  @override
  List<CommentEntity> get commentList {
    _$commentListAtom.reportRead();
    return super.commentList;
  }

  @override
  set commentList(List<CommentEntity> value) {
    _$commentListAtom.reportWrite(value, super.commentList, () {
      super.commentList = value;
    });
  }

  late final _$_getDataAsyncAction =
      AsyncAction('_NewsDetailViewModelBase._getData', context: context);

  @override
  Future<void> _getData() {
    return _$_getDataAsyncAction.run(() => super._getData());
  }

  @override
  String toString() {
    return '''
entity: ${entity},
commentList: ${commentList}
    ''';
  }
}
