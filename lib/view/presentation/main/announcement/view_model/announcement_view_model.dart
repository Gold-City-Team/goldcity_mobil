import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/domain/entity/announcement/announcement_entity.dart';
import 'package:goldcity/domain/usecase/announcement_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:mobx/mobx.dart';

part 'announcement_view_model.g.dart';

class AnnouncementViewModel = _AnnouncementViewModelBase
    with _$AnnouncementViewModel;

abstract class _AnnouncementViewModelBase with Store, BaseViewModel {
  late AnnouncementUseCase _announcementUseCase;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    _announcementUseCase = locator<AnnouncementUseCase>();
    _getData();
    _getDataDetail();
  }

  @observable
  List<AnnouncementEntity>? entity;

  @observable
  AnnouncementEntity? detail;

  @observable
  int selectedIndex = 0;

  @action
  void changeSelectedIndex(int value) {
    selectedIndex = value;
    _getDataDetail();
  }

  @action
  Future<void> _getDataDetail() async {
    _announcementUseCase.getAnnouncement(selectedIndex).listen((result) {
      if (result.isRight) {
        detail = result.right;
      }
    });
  }

  @action
  Future<void> _getData() async {
    _announcementUseCase.getAnnouncementList().listen((result) {
      if (result.isRight) {
        entity = result.right;
        changeSelectedIndex(result.right.first.id);
      }
    });
  }
}
