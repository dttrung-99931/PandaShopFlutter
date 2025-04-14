import 'dart:io';

extension FileExtension on File {
  String get name {
    return path.split('/').last;
  }
}
