// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_text_image_template_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProjectTextImageTemplateViewModel
    on _ProjectTextImageTemplateViewModelBase, Store {
  late final _$selectedImageGalleryIdAtom = Atom(
      name: '_ProjectTextImageTemplateViewModelBase.selectedImageGalleryId',
      context: context);

  @override
  int get selectedImageGalleryId {
    _$selectedImageGalleryIdAtom.reportRead();
    return super.selectedImageGalleryId;
  }

  @override
  set selectedImageGalleryId(int value) {
    _$selectedImageGalleryIdAtom
        .reportWrite(value, super.selectedImageGalleryId, () {
      super.selectedImageGalleryId = value;
    });
  }

  late final _$templateAtom = Atom(
      name: '_ProjectTextImageTemplateViewModelBase.template',
      context: context);

  @override
  ProjectTemplateEightEntity? get template {
    _$templateAtom.reportRead();
    return super.template;
  }

  @override
  set template(ProjectTemplateEightEntity? value) {
    _$templateAtom.reportWrite(value, super.template, () {
      super.template = value;
    });
  }

  late final _$titleAtom = Atom(
      name: '_ProjectTextImageTemplateViewModelBase.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom = Atom(
      name: '_ProjectTextImageTemplateViewModelBase.description',
      context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$_ProjectTextImageTemplateViewModelBaseActionController =
      ActionController(
          name: '_ProjectTextImageTemplateViewModelBase', context: context);

  @override
  void changeSelectedImageGalleryId(int newIndex) {
    final _$actionInfo =
        _$_ProjectTextImageTemplateViewModelBaseActionController.startAction(
            name:
                '_ProjectTextImageTemplateViewModelBase.changeSelectedImageGalleryId');
    try {
      return super.changeSelectedImageGalleryId(newIndex);
    } finally {
      _$_ProjectTextImageTemplateViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedGallerySet() {
    final _$actionInfo =
        _$_ProjectTextImageTemplateViewModelBaseActionController.startAction(
            name:
                '_ProjectTextImageTemplateViewModelBase.setSelectedGallerySet');
    try {
      return super.setSelectedGallerySet();
    } finally {
      _$_ProjectTextImageTemplateViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedImageGalleryId: ${selectedImageGalleryId},
template: ${template},
title: ${title},
description: ${description}
    ''';
  }
}
