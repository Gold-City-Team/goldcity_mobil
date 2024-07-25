// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/complex/complex/complex_entity.dart';
import 'package:goldcity/domain/entity/project/project/project_entity.dart';
import 'package:goldcity/domain/usecase/complex_usecase.dart';
import 'package:goldcity/domain/usecase/project_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/util/extension/util_extension.dart';
import 'package:goldcity/view/presentation/main/home/widget/condominium_trailer_widget.dart';
import 'package:goldcity/view/presentation/main/home/widget/project_list_widget.dart';
import 'package:mobx/mobx.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  late ProjectUseCase _projectUseCase;
  late ComplexUseCase _complexUseCase;
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    debugPrint("gird,");
    _projectUseCase = locator<ProjectUseCase>();
    _complexUseCase = locator<ComplexUseCase>();
    pageList.clear();
    projectList?.clear();
    complexList?.clear();
    _getComplexList();
    isTablet()
        ? SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeRight,
            DeviceOrientation.landscapeLeft,
          ])
        : SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
  }

  @observable
  var pageList = ObservableList<Widget>.of([]);
  @observable
  int pageIndex = -1;
  @observable
  List<ProjectEntity>? projectList;
  @action
  void _getProjectList() {
    projectList?.clear();

    _projectUseCase.getProjectList().listen((event) {
      if (event.isRight) {
        projectList = event.right;
        pageList.add(ProjectListWidget(
          projectList: projectList!,
          onTap: (int id) => navigateProjectDetail(id),
        ));
      } else {
        debugPrint("test: ${event.left.status}");
      }
    });
  }

  @observable
  bool isPageSelectorVisible = false;
  @observable
  bool isPageSelectorLock = true;
  @action
  void togglePageSelector() {
    isPageSelectorVisible = !isPageSelectorVisible;
    if (isPageSelectorVisible != false) {
      isPageSelectorLock = false;
    }
  }

  @observable
  List<ComplexEntity>? complexList;

  @action
  void _getComplexList() {
    complexList?.clear();
    _complexUseCase.getComplexList().listen((event) {
      if (event.isRight) {
        complexList = event.right;
        pageList.add(
          CondominiumTrailerWidget(
            complexEntity: complexList!.first,
            onExploreTap: () => navigateComplexDetail(0),
          ),
        );
        _getProjectList();

        pageIndex = 0;
      }
    });
  }

  void navigateProjectDetail(int projectId) {
    viewModelContext.goNamed(
      NavigationConstant.PROJECT_DETAIL,
      pathParameters: {"projectId": "$projectId"},
    );
  }

  void navigateComplexDetail(int complexId) {
    viewModelContext.goNamed(NavigationConstant.COMPLEX_DETAIL);
  }

  @action
  Future<void> changeIndex(newIndex) async {
    togglePageSelector();
    if (newIndex != pageIndex) {
      switch (newIndex) {
        case 0:
          viewModelContext.pushReplacement(NavigationConstant.MAIN);
        case 1:
          viewModelContext.goNamed(NavigationConstant.WEBINARS);
        case 2:
          viewModelContext.goNamed(NavigationConstant.EDUCATIONS);
        case 3:
          await viewModelContext.pushNamed(NavigationConstant.SETTINGS);
          init();
        case 4:
          await viewModelContext.pushNamed(NavigationConstant.LEAD_APPLY);
          init();
        default:
          viewModelContext.pushReplacement(NavigationConstant.MAIN);
      }
    }
  }
}
