import 'dart:io';

import 'package:path_provider/path_provider.dart';

class StorageUsage {
  const StorageUsage(this.totalBytes);

  final int totalBytes;

  String get displayMb => (totalBytes / (1024 * 1024)).toStringAsFixed(1);
}

Future<List<Directory>> _artifactDirectories() async {
  final dirs = <Directory>[];
  try {
    dirs.add(await getApplicationDocumentsDirectory());
  } on Exception {
    return dirs;
  }
  try {
    dirs.add(await getApplicationCacheDirectory());
  } on Exception {
    return dirs;
  }
  return dirs;
}

bool _isArtifact(String name) =>
    name.startsWith('my_app-') || name.startsWith('update-download');

Future<StorageUsage> computeUpdateArtifactsUsage() async {
  var total = 0;
  for (final dir in await _artifactDirectories()) {
    try {
      for (final entity in dir.listSync()) {
        if (entity is! File) continue;
        final name = entity.uri.pathSegments.last;
        if (_isArtifact(name)) {
          total += entity.lengthSync();
        }
      }
    } on Exception {
      continue;
    }
  }
  return StorageUsage(total);
}

Future<void> clearUpdateArtifacts() async {
  for (final dir in await _artifactDirectories()) {
    try {
      for (final entity in dir.listSync()) {
        if (entity is! File) continue;
        final name = entity.uri.pathSegments.last;
        if (_isArtifact(name)) {
          try {
            await entity.delete();
          } on FileSystemException {
            continue;
          }
        }
      }
    } on Exception {
      continue;
    }
  }
}
