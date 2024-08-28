import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/news/news_entity.dart';
import 'package:goldcity/domain/usecase/news_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:mobx/mobx.dart';
part 'news_view_model.g.dart';

class NewsViewModel = _NewsViewModelBase with _$NewsViewModel;

abstract class _NewsViewModelBase with Store, BaseViewModel {
  late NewsUseCase _educationUseCase;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    _educationUseCase = locator<NewsUseCase>();
    _getData();
  }

  @observable
  List<NewsEntity>? entity;
  @action
  Future<void> _getData() async {
    var result = await _educationUseCase.getNews();
    if (result.isRight) {
      entity = result.right;
    }
  }

  void navigateEducationDetail(int id) {
    viewModelContext.goNamed(
      NavigationConstant.EDUCATION_DETAIL,
      pathParameters: {"educationId": "$id"},
    );
  }
}
