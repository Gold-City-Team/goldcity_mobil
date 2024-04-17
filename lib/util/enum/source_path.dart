// ignore_for_file: constant_identifier_names

enum SourcePath { BASE_URL, LEAD, PROJECT, PROJECT_GALLERY, MEDIA }

extension SourcePathExtension on SourcePath {
  String rawValue({List<dynamic>? data}) {
    return switch (this) {
      SourcePath.BASE_URL => "https://api.goldcitycondominium.com",
      SourcePath.MEDIA => "https://api.goldcitycondominium.com/media/",
      SourcePath.LEAD => '/lead',
      SourcePath.PROJECT => '/project/${data?[0]}/selectedlanguage',
      SourcePath.PROJECT_GALLERY =>
        '/projectgallery/${data?[0]}/selectedlanguage',
    };
  }
}
