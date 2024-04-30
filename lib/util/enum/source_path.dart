// ignore_for_file: constant_identifier_names

enum SourcePath { BASE_URL, LEAD, PROJECT, PROJECT_GALLERY, MEDIA }

extension SourcePathExtension on SourcePath {
  String rawValue({List<dynamic>? data}) {
    return switch (this) {
      SourcePath.BASE_URL => "https://gold-city.denizegece.com.tr",
      SourcePath.MEDIA => "https://gold-city.denizegece.com.tr/media/",
      SourcePath.LEAD => '/lead',
      SourcePath.PROJECT => '/project/${data?[0]}/selectedlanguage',
      SourcePath.PROJECT_GALLERY =>
        '/projectgallery/${data?[0]}/selectedlanguage',
    };
  }
}
