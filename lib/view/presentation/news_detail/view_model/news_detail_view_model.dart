import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:goldcity/config/base/view_model/base_view_model.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';
import 'package:goldcity/data/dto/send/comment/news_send_comment_dto.dart';
import 'package:goldcity/domain/entity/news/comment_entity.dart';
import 'package:goldcity/domain/entity/news/news_entity.dart';
import 'package:goldcity/domain/usecase/news_usecase.dart';
import 'package:goldcity/injection_container.dart';
import 'package:goldcity/view/widget/snackbar/error_snackbar.dart';
import 'package:goldcity/view/widget/snackbar/info_snackbar.dart';
import 'package:mobx/mobx.dart';
part 'news_detail_view_model.g.dart';

class NewsDetailViewModel = _NewsDetailViewModelBase with _$NewsDetailViewModel;

abstract class _NewsDetailViewModelBase with Store, BaseViewModel {
  late NewsUseCase _newsUseCase;

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  int newsId = 0;

  @override
  void init() {
    _newsUseCase = locator<NewsUseCase>();
    _getData();
  }

  @observable
  NewsEntity? entity;

  @observable
  List<CommentEntity> commentList = [];

  String userName = "";
  String content = "";

  @action
  Future<void> _getData() async {
    var result = await _newsUseCase.getNewsDetail(newsId);
    if (result.isRight) {
      entity = result.right;
    }

    var resultComment = await _newsUseCase.getComment(newsId);
    if (result.isRight) {
      commentList = resultComment.right;
    }
  }

  Future<void> SendComment() async {
    var result = await _newsUseCase.sendComment(SendNewsCommentDto(
        newsId: newsId, content: content, userName: userName));
    if (result != null) {
      showSnackbar(ErrorSnackBar(message: "Bir Hata Oluştu!"))
          .show(viewModelContext);
    } else {
      showSnackbar(InfoSnackBar(message: LocaleKeys.addComment.tr()))
          .show(viewModelContext);
    }
  }
}
