part of '../lexactivator.dart';

class UserLicense {
  final int allowedActivations;
  final int allowedDeactivations;
  final String key;
  final int totalActivations;
  final int totalDeactivations;
  final String type;
  final List<LicenseMetadata> metadata;

  UserLicense({
    required this.allowedActivations,
    required this.allowedDeactivations,
    required this.key,
    required this.totalActivations,
    required this.totalDeactivations,
    required this.type,
    required this.metadata,
  });

  factory UserLicense.fromJson(Map<String, dynamic> json) {
    return UserLicense(
      allowedActivations: json['allowedActivations'] ?? 0,
      allowedDeactivations: json['allowedDeactivations'] ?? 0,
      key: json['key'] ?? '',
      totalActivations: json['totalActivations'] ?? 0,
      totalDeactivations: json['totalDeactivations'] ?? 0,
      type: json['type'] ?? '',
      metadata: (json['metadata'] as List<dynamic>?)
              ?.map((e) => LicenseMetadata.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class LicenseMetadata {
  final String key;
  final String value;
  LicenseMetadata({
    required this.key,
    required this.value,
  });

  factory LicenseMetadata.fromJson(Map<String, dynamic> json) {
    return LicenseMetadata(
      key: json['key'] ?? '',
      value: json['value'] ?? '',
    );
  }
}
