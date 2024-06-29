import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:goldcity/config/language/locale_keys.g.dart';

bool isTablet() {
  final data = MediaQueryData.fromView(
      WidgetsBinding.instance.platformDispatcher.views.single);
  return data.size.shortestSide < 600 ? false : true;
}

extension LocaleToNativeLanguage on String {
  String get localeToNativeLanguage {
    return switch (this) {
      "en-US" => LocaleKeys.english.tr(),
      "tr-TR" => LocaleKeys.turkish.tr(),
      _ => LocaleKeys.english.tr(),
    };
  }
}

const List monthsInYear = [
  "Ocak",
  "Şubat",
  "Mart",
  "Nisan",
  "Mayıs",
  "Haziran",
  "Temmuz",
  "Ağustos",
  "Eylül",
  "Ekim",
  "Kasım",
  "Aralık",
];

extension FormatTime on DateTime {
  String get formatTime {
    return "$day ${monthsInYear[month - 1]} $year / ${hour < 10 ? "0$hour" : "$hour"}:${minute < 10 ? "0$minute" : "$minute"}";
  }
}
