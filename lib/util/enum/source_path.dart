// ignore_for_file: constant_identifier_names

enum SourcePath {
  BASE_URL,
  LEAD,
  COMPLEX,
  COMPLEX_LIST,
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
  EDUCATION_LIST,
  EDUCATION_GALLERY,
  USER_WEBINAR,
  SEND_NOTIFICATION,
}

extension SourcePathExtension on SourcePath {
  String rawValue({List<dynamic>? data}) {
    return switch (this) {
      SourcePath.BASE_URL => "https://gold-city-2.denizegece.com.tr",
      SourcePath.MEDIA => "https://gold-city-2.denizegece.com.tr/media/",
      SourcePath.LEAD => '/lead',
      SourcePath.PROJECT => '/project/${data?[0]}/selectedlanguage',
      SourcePath.PROJECT_LANGUAGE_LIST =>
        '/project/${data?[0]}/supportedlanguage',
      SourcePath.COMPLEX => '/complex/${data?[0]}/selectedlanguage',
      SourcePath.COMPLEX_LIST => '/complex/selectedlanguage',
      SourcePath.PROJECT_LIST => '/project',
      SourcePath.PROJECT_INTERIOR_GALLERY =>
        '/projectdetail/${data?[0]}/interiorgallery',
      SourcePath.PROJECT_OUTDOOR_GALLERY =>
        '/projectdetail/${data?[0]}/outdoorgallery',
      SourcePath.PROJECT_POSSIBILITY =>
        '/projectdetail/${data?[0]}/possibilities',
      SourcePath.PROJECT_TEMPLATE_DETAIL =>
        '/projectdetail/${data?[0]}/templates/${data?[1]}',
      SourcePath.COMPLEX_TEMPLATE_DETAIL =>
        '/complexdetail/${data?[0]}/templates/${data?[1]}',
      SourcePath.WEBINAR_LIST => '/meeting',
      SourcePath.WEBINAR => '/meeting/${data?[0]}',
      SourcePath.USER_WEBINAR => '/usermeeting/${data?[0]}',
      SourcePath.SEND_NOTIFICATION => '/notification/addtoken',
      SourcePath.EDUCATION_LIST => '/education/selectedlanguage',
      SourcePath.EDUCATION => '/education/${data?[0]}/selectedlanguage',
      SourcePath.EDUCATION_GALLERY => '/educationgallery/${data?[0]}',
    };
  }
}
