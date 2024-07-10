import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goldcity/util/constant/navigation_constant.dart';
import 'package:goldcity/util/extension/util_extension.dart';

class NotificationNavigation {
  navigateAccordingToNotification(
      Map<String, dynamic> data, BuildContext context) {
    switch (data["Type"].toString().humanToNotification) {
      case NOTIFICATION_TYPE.PROJECT_DETAIL_REMOVE_DRAFT:
        context.goNamed(
          NavigationConstant.PROJECT_DETAIL,
          pathParameters: {"projectId": "${data['ProjectId']}"},
        );
      case NOTIFICATION_TYPE.MEETING_REMINDER:
        context.goNamed(
          NavigationConstant.WEBINAR_DETAIL,
          pathParameters: {"meetingId": "${data['MeetingId']}"},
        );
      case NOTIFICATION_TYPE.CUSTOM:
    }
  }
}
