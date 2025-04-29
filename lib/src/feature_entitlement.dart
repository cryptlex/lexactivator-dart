part of '../lexactivator.dart';

class FeatureEntitlement {
  final String featureName;
  final String value;

  FeatureEntitlement({required this.featureName, required this.value});

  factory FeatureEntitlement.fromJson(Map<String, dynamic> json) {
    return FeatureEntitlement(
        featureName: json['featureName'] ?? '',
        value: json['value'] ?? ''
    );
  }
}