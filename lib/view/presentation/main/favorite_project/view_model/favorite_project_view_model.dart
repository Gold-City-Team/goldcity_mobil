import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/project/project/project_entity.dart';
import 'package:goldcity/domain/usecase/project_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:mobx/mobx.dart';
part 'favorite_project_view_model.g.dart';

class FavoriteProjectViewModel = _FavoriteProjectViewModelBase
    with _$FavoriteProjectViewModel;

abstract class _FavoriteProjectViewModelBase with Store, BaseViewModel {
  late ProjectUseCase _projectUseCase;

  @override
  void setContext(BuildContext context) => viewModelContext = context;
  @override
  void init() {
    _projectUseCase = locator<ProjectUseCase>();
    _getProjectList();
  }

  @observable
  List<ProjectEntity>? projectList;

  @action
  Future<void> _getProjectList() async {
    projectList?.clear();

    _projectUseCase.getProjectList().listen((event) {
      if (event.isRight) {
        projectList = event.right;
      }
    });
  }
}
