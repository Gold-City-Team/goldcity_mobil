// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/config/notifier/theme_notifier.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'story_view_model.g.dart';

class StoryViewModel = _StoryViewModelBase with _$StoryViewModel;

abstract class _StoryViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    _getSource();
  }

  @observable
  List<String> storyList = [];

  @observable
  int index = 0;
  @action
  void previusStory() {
    index = index == 0 ? 0 : index - 1;
  }

  @action
  void nextStory() {
    index = index >= storyList.length - 1 ? storyList.length - 1 : index + 1;
  }

  @action
  Future<void> _getSource() async {
    await Future.delayed(const Duration(seconds: 1));

    storyList = [
      "https://wallpapers.com/images/hd/4k-architecture-yellow-glass-building-6d7nbmyltxlyxxv8.jpg",
      "https://wallpapercave.com/wp/wp2752752.jpg",
      "https://wallpapercave.com/wp/wp2752761.jpg",
      "https://wallpapercave.com/wp/wp2752760.jpg"
    ];
    viewModelContext.read<ThemeNotifier>().toggleTheme();
  }
}
