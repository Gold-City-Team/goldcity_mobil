// ignore_for_file: constant_identifier_names

enum SourcePath { LEAD, PROJECT }

extension SourcePathExtension on SourcePath {
  String rawValue({List<dynamic>? data}) {
    return switch (this) {
      SourcePath.LEAD => '/lead',
      SourcePath.PROJECT => '/project/${data?[0]}',
    };
  }
}
