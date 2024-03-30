// ignore_for_file: constant_identifier_names

enum SourcePath { LEAD }

extension SourcePathExtension on SourcePath {
  String rawValue({List<dynamic>? data}) {
    return switch (this) {
      SourcePath.LEAD => '/lead',
    };
  }
}
