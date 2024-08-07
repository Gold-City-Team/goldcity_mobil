// ignore_for_file: constant_identifier_names

enum SourcePath {
  BASE_URL,
  LEAD,
  LEAD_LOGIN,
  LEAD_LOGIN_GOOGLE,
  COMPLEX,
  COMPLEX_LIST,
  ANNOUNCEMENT_LIST,
  ANNOUNCEMENT,
  PROJECT,
  PROJECT_LANGUAGE_LIST,
  PROJECT_LIST,
  PROJECT_POSSIBILITY,
  PROJECT_TEMPLATE_DETAIL,
  COMPLEX_TEMPLATE_DETAIL,
  PROJECT_INTERIOR_GALLERY,
  PROJECT_OUTDOOR_GALLERY,
  MEDIA,
  WEBINAR_LIST,
  WEBINAR,
  EDUCATION,
  CONTACT,
  EDUCATION_LIST,
  EDUCATION_GALLERY,
  USER_WEBINAR,
  SEND_NOTIFICATION,
  SHARE_PAGE,
  SHARE_PAGE_DETAIL,
  COMPLEX_LANGUAGE_LIST
}

extension SourcePathExtension on SourcePath {
  String rawValue({List<dynamic>? data}) {
    return switch (this) {
      SourcePath.BASE_URL => "https://gold-city-2.denizegece.com.tr",
      SourcePath.MEDIA => "https://gold-city-2.denizegece.com.tr/media/",
      SourcePath.LEAD_LOGIN => '/auth/mobilelogin',
      SourcePath.LEAD_LOGIN_GOOGLE => '/auth/logingoogle',
      SourcePath.LEAD => '/lead',
      SourcePath.CONTACT => '/contact',
      SourcePath.PROJECT => '/project/${data?[0]}/selectedlanguage/${data?[1]}',
      SourcePath.PROJECT_LANGUAGE_LIST =>
        '/project/${data?[0]}/supportedlanguage',
      SourcePath.COMPLEX => '/complex/${data?[0]}/selectedlanguage/${data?[1]}',
      SourcePath.COMPLEX_LANGUAGE_LIST =>
        '/complex/${data?[0]}/supportedlanguage',
      SourcePath.COMPLEX_LIST => '/complex',
      SourcePath.ANNOUNCEMENT_LIST => '/announcement/myannouncement',
      SourcePath.ANNOUNCEMENT => '/announcement/myannouncement/${data?[0]}',
      SourcePath.PROJECT_LIST => '/project',
      SourcePath.PROJECT_INTERIOR_GALLERY =>
        '/projectdetail/${data?[0]}/interiorgallery',
      SourcePath.PROJECT_OUTDOOR_GALLERY =>
        '/projectdetail/${data?[0]}/outdoorgallery',
      SourcePath.PROJECT_POSSIBILITY =>
        '/projectdetail/${data?[0]}/possibilities',
      SourcePath.PROJECT_TEMPLATE_DETAIL =>
        '/projectdetail/templates/${data?[0]}',
      SourcePath.COMPLEX_TEMPLATE_DETAIL =>
        '/complexdetail/templates/${data?[0]}',
      SourcePath.WEBINAR_LIST => '/meeting',
      SourcePath.WEBINAR => '/meeting/${data?[0]}',
      SourcePath.USER_WEBINAR => '/usermeeting/${data?[0]}',
      SourcePath.SEND_NOTIFICATION => '/notification/addtoken',
      SourcePath.EDUCATION_LIST => '/education/selectedlanguage',
      SourcePath.EDUCATION => '/education/${data?[0]}/selectedlanguage',
      SourcePath.EDUCATION_GALLERY => '/educationgallery/${data?[0]}',
      SourcePath.SHARE_PAGE => '/shareablepage',
      SourcePath.SHARE_PAGE_DETAIL => '/shareablepage/${data?[0]}',
    };
  }
}
