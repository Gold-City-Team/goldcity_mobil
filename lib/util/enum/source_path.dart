// ignore_for_file: constant_identifier_names

enum SourcePath {
  BASE_URL,
  LEAD,
  COMPLEX,
  COMPLEX_LIST,
  PROJECT,
  PROJECT_LIST,
  PROJECT_POSSIBILITY,
  PROJECT_TEMPLATE_DETAIL,
  COMPLEX_TEMPLATE_DETAIL,
  PROJECT_INTERIOR_GALLERY,
  PROJECT_OUTDOOR_GALLERY,
  MEDIA
}

extension SourcePathExtension on SourcePath {
  String rawValue({List<dynamic>? data}) {
    return switch (this) {
      SourcePath.BASE_URL => "https://gold-city-2.denizegece.com.tr",
      SourcePath.MEDIA => "https://gold-city-2.denizegece.com.tr/media/",
      SourcePath.LEAD => '/lead',
      SourcePath.PROJECT => '/project/${data?[0]}/selectedlanguage',
      SourcePath.COMPLEX => '/complex/${data?[0]}/selectedlanguage',
      SourcePath.COMPLEX_LIST => '/complex/selectedlanguage',
      SourcePath.PROJECT_LIST => '/project/selectedlanguage',
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
    };
  }
}
