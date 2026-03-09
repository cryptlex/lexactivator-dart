part of '../lexactivator.dart';

class FeatureEntitlement {
  final String featureName;
  final String featureDisplayName;
  final String value;
  final String baseValue;
  final int expiresAt;

  FeatureEntitlement({
    required this.featureName,
    required this.featureDisplayName,
    required this.value,
    required this.baseValue,
    required this.expiresAt,
  });

  factory FeatureEntitlement.fromJson(Map<String, dynamic> json) {
    return FeatureEntitlement(
        featureName: json['featureName'] ?? '',
        featureDisplayName: json['featureDisplayName'] ?? '',
        value: json['value'] ?? '',
        baseValue: json['baseValue'] ?? '',
        expiresAt: json['expiresAt'] ?? 0,
    );
  }
}