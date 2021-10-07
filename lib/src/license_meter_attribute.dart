part of '../lexactivator.dart';

class LicenseMeterAttribute {
  final String name;
  final int allowedUses;
  final int totalUses;
  final int grossUses;

  LicenseMeterAttribute(
      this.name, this.allowedUses, this.totalUses, this.grossUses);

}
