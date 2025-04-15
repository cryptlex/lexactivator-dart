part of '../lexactivator.dart';

/// A class representing a software release.
///
/// Contains information about a release including version, files, platforms etc.
class Release {
  /// Total number of files in the release
  final int totalFiles;

  /// Whether the release is private
  final bool isPrivate;

  /// Whether the release has been published
  final bool published;

  /// Unique identifier for the release
  final String id;

  /// Timestamp when release was created
  final String createdAt;

  /// Timestamp when release was last updated
  final String updatedAt;

  /// Name of the release
  final String name;

  /// Release channel
  final String channel;

  /// Version number/string
  final String version;

  /// Release notes
  final String notes;

  /// Timestamp when release was published
  final String publishedAt;

  /// ID of the associated product
  final String productId;

  /// Supported platforms
  final List<String> platforms;

  /// Files included in the release
  final List<ReleaseFile> files;

  Release({
    required this.totalFiles,
    required this.isPrivate,
    required this.published,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.channel,
    required this.version,
    required this.notes,
    required this.publishedAt,
    required this.productId,
    required this.platforms,
    required this.files,
  });

  /// Creates a Release instance from JSON data
  factory Release.fromJson(Map<String, dynamic> json) {
    return Release(
      totalFiles: json['totalFiles'] ?? 0,
      isPrivate: json['private'] ?? false,
      published: json['published'] ?? false,
      id: json['id'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      name: json['name'] ?? '',
      channel: json['channel'] ?? '',
      version: json['version'] ?? '',
      notes: json['notes'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      productId: json['productId'] ?? '',
      platforms: (json['platforms'] as List).cast<String>(),
      files: (json['files'] as List)
          .map((f) => ReleaseFile.fromJson(f as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// Represents a file within a release
class ReleaseFile {
  /// Size of file in bytes
  final int size;

  /// Number of downloads
  final int downloads;

  /// Whether file is secured
  final bool secured;

  /// Unique identifier for the file
  final String id;

  /// Name of the file
  final String name;

  /// Download URL
  final String url;

  /// File extension
  final String extension;

  /// File checksum
  final String checksum;

  /// ID of associated release
  final String releaseId;

  /// When file was created
  final String createdAt;

  /// When file was last updated
  final String updatedAt;

  ReleaseFile({
    required this.size,
    required this.downloads,
    required this.secured,
    required this.id,
    required this.name,
    required this.url,
    required this.extension,
    required this.checksum,
    required this.releaseId,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Creates a ReleaseFile instance from JSON data
  factory ReleaseFile.fromJson(Map<String, dynamic> json) {
    return ReleaseFile(
      size: json['size'] as int,
      downloads: json['downloads'] as int,
      secured: json['secured'] as bool,
      id: json['id'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
      extension: json['extension'] as String,
      checksum: json['checksum'] as String,
      releaseId: json['releaseId'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );
  }
}
