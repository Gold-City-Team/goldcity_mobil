import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:mobx/mobx.dart';

part 'documents_view_model.g.dart';

class DocumentsViewModel = _DocumentsViewModelBase with _$DocumentsViewModel;

abstract class _DocumentsViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {}
}
