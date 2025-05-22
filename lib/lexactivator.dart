// ignore_for_file: non_constant_identifier_names, constant_identifier_names

///LexActivator wrapper for Dart and Flutter. The library lex_activator
///is part of the lex_activator package.
library lexactivator;

import 'dart:convert';
import 'dart:io';
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'src/lexactivator_native.dart';

part 'src/lexactivator_exception.dart';
part 'src/lex_status_codes.dart';
part 'src/license_meter_attribute.dart';
part 'src/product_version_feature_flag.dart';
part 'src/activation_mode.dart';
part 'src/organisation_address.dart';
part 'src/user_license.dart';
part 'src/feature_entitlement.dart';

class LexActivator {
  ///User Permission Flag
  static const int LA_USER = 1;

  ///System Permission Flag
  static const int LA_SYSTEM = 2;

  ///System Permission Flag
  static const int LA_ALL_USERS = 3;

  ///In Memory Permission Flag
  static const int LA_IN_MEMORY = 4;

  static const int LA_RELEASES_ALL = 1;
  static const int LA_RELEASES_ALLOWED = 2;

  static final DynamicLibrary _dynamicLibrary = loadLib();

  static final LexActivatorNative _lexActivatorNative =
      LexActivatorNative(_dynamicLibrary);

  /// Sets the absolute path of the Product.dat file where [filePath] is the absolute
  /// path of the product file (Product.dat).
  ///
  /// This function must be called on every start of your program before any other
  /// functions are called.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int SetProductFile({required String filePath}) {
    int status = _lexActivatorNative.SetProductFile(
      filePath,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// Embeds the Product.dat file in the application where [productData] is the
  /// content of the Product.dat file.
  ///
  /// It can be used instead of [SetProductFile()] in case you want to embed the
  /// Product.dat file in your application. This function must be called on
  /// every start of your program before any other functions are called.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int SetProductData({required String productData}) {
    int status = _lexActivatorNative.SetProductData(productData);
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// Sets the product id of your application to [productId] which is mentioned on the
  /// product page in the Cryptlex dashboard.
  ///
  /// Depending upon whether your application requires admin/root permissions to
  /// run or not, [flags] can have one of the following values: LA_SYSTEM,
  /// LA_USER, LA_IN_MEMORY.
  ///
  /// This function must be called on every start of your program before any other
  /// functions are called, with the exception of [SetProductFile()] or
  /// [SetProductData()] function.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int SetProductId({required String productId, required int flags}) {
    int status = _lexActivatorNative.SetProductId(
      productId,
      flags,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// In case you want to change the default directory used by LexActivator to
  /// store the activation data on Linux and macOS, this function can be used to
  /// set it to [directoryPath] which is the absolute path of the directory.
  ///
  /// If you decide to use this function, then it must be called on every start of
  /// your program before calling [SetProductFile()] or [SetProductData()] function.
  /// Please ensure that the directory exists and your app has read and write
  /// permissions in the directory.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int SetDataDirectory({required String directoryPath}) {
    int status = _lexActivatorNative.SetDataDirectory(
      directoryPath,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// Enables or disables in-memory caching for LexActivator.
  ///
  /// This function is designed to control caching behavior to suit specific application requirements.
  /// Caching is enabled by default to enhance performance.
  ///
  /// Disabling caching is recommended in environments where multiple processes access the same license on a
  /// single machine and require real-time updates to the license state.
  ///
  /// The function throws a [LexActivatorException] on error.
  static int SetCacheMode({required bool enable}) {
    final enableFlag = enable ? 1 : 0;
    int status = _lexActivatorNative.SetCacheMode(enableFlag);
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// This function can be used to set a custom device fingerprint to [fingerprint]
  /// which is a string of minimum length 64 characters and maximum length 256 characters,
  /// in case you don't want to use the LexActivator's advanced device fingerprinting algorithm.
  ///
  /// If you decide to use your own custom device fingerprint then this function must be
  /// called on every start of your program immediately after calling [SetProductFile()]
  /// or [SetProductData()] function.
  /// The license fingerprint matching strategy is ignored if this function is used.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int SetCustomDeviceFingerprint({required String fingerprint}) {
    int status = _lexActivatorNative.SetCustomDeviceFingerprint(
      fingerprint,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// Sets the [licenseKey] required to activate the license.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int SetLicenseKey({required String licenseKey}) {
    int status = _lexActivatorNative.SetLicenseKey(
      licenseKey,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// Sets the license [email] and [password] for authentication.
  ///
  /// This function must be called before [ActivateLicense()] or [IsLicenseGenuine()]
  /// function if __requireAuthentication__ property of the license is set to true.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int SetLicenseUserCredential({
    required String email,
    required String password,
  }) {
    int status = _lexActivatorNative.SetLicenseUserCredential(
      email,
      password,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// Sets server sync [callback] function.
  ///
  /// Whenever the server sync occurs in a separate thread, and server returns the
  /// response, event listener function gets invoked with the following [LexStatusCodes]:
  ///
  /// LA_OK, LA_EXPIRED, LA_SUSPENDED, LA_E_REVOKED,
  /// LA_E_ACTIVATION_NOT_FOUND, LA_E_MACHINE_FINGERPRINT LA_E_COUNTRY, LA_E_INET,
  /// LA_E_SERVER, LA_E_RATE_LIMIT, LA_E_IP
  ///
  /// The function throws a [LexActivatorException] on error.

  static int SetLicenseCallback({required LicenseCallbackFuncDart callback}) {
    final licenseCallback =
        NativeCallable<LicenseCallbackFunc>.listener(callback);

    int status = _lexActivatorNative.SetLicenseCallback(
      licenseCallback.nativeFunction,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// Sets the activation metadata with a [key], [value] pair.
  ///
  /// [key], and [value] are strings of maximum length 256 characters with utf-8 encoding.
  /// The metadata appears along with the activation details of the license in
  /// dashboard.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int SetActivationMetadata({
    required String key,
    required String value,
  }) {
    int status = _lexActivatorNative.SetActivationMetadata(
      key,
      value,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// Sets the trial activation metadata with a [key], [value] pair.
  ///
  /// [key], and [value] are strings of maximum length 256 characters with utf-8 encoding.
  /// The metadata appears along with the trial activation details of the product
  /// in dashboard.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int SetTrialActivationMetadata({
    required String key,
    required String value,
  }) {
    int status = _lexActivatorNative.SetTrialActivationMetadata(
      key,
      value,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// Sets the current [appVersion] of your application.
  ///
  /// [appVersion] is string of maximum length 256 characters with UTF-8 encoding.
  /// The app version appears along with the activation details in dashboard. It is
  /// also used to generate app analytics.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int SetAppVersion({
    required String appVersion,
  }) {
    int status = _lexActivatorNative.SetAppVersion(
      appVersion,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// Sets the release published date of your application.
  ///
  /// [releasePublishedDate] is a unix timestamp of the release published date.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int SetReleasePublishedDate({
    required int releasePublishedDate,
  }) {
    int status = _lexActivatorNative.SetReleasePublishedDate(
      releasePublishedDate,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// Sets the release platform e.g. windows, macos, linux
  ///
  /// The release platform appears along with the activation details in dashboard.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int SetReleasePlatform({
    required String releasePlatform,
  }) {
    int status = _lexActivatorNative.SetReleasePlatform(
      releasePlatform,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// Sets the release channel e.g. stable, beta
  ///
  /// The release channel appears along with the activation details in dashboard.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int SetReleaseChannel({
    required String releaseChannel,
  }) {
    int status = _lexActivatorNative.SetReleaseChannel(
      releaseChannel,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// Sets the meter attribute [uses] for the offline activation request to the given
  /// [name].
  ///
  /// This function should only be called before [GenerateOfflineActivationRequest()]
  /// function to set the meter attributes in case of offline activation.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int SetOfflineActivationRequestMeterAttributeUses({
    required String name,
    required int uses,
  }) {
    int status =
        _lexActivatorNative.SetOfflineActivationRequestMeterAttributeUses(
      name,
      uses,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// Sets the network [proxy] to be used when contacting Cryptlex servers.
  ///
  /// The proxy format should be: (protocol://)(username:password@)machine(:port)
  ///
  /// __Note:__ Proxy settings of the computer are automatically detected. So,
  /// in most of the cases you don't need to care whether your user is behind a
  /// proxy server or not.
  ///
  /// @param proxy proxy string having correct proxy format
  /// The function throws a [LexActivatorException] on error.

  static int SetNetworkProxy({
    required String proxy,
  }) {
    int status = _lexActivatorNative.SetNetworkProxy(
      proxy,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// Sets the [host] for your on-premise server, in case
  /// you are running Cryptlex on-premise.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int SetCryptlexHost(
    String host,
  ) {
    int status = _lexActivatorNative.SetCryptlexHost(
      host,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// Sets the lease duration for the activation.
  ///
  /// The activation lease duration is honoured when the allow client
  /// lease duration property is enabled.
  ///
  /// The [leaseDuration] is the value of the lease duration. A value of -1 indicates
  /// unlimited lease duration.
  ///
  /// Returns [LexStatusCodes.LA_OK] on success.
  /// May return [LexStatusCodes.LA_E_PRODUCT_ID] or [LexStatusCodes.LA_E_LICENSE_KEY] on failure.

  static int SetActivationLeaseDuration({required int leaseDuration}) {
    int status = _lexActivatorNative.SetActivationLeaseDuration(
      leaseDuration,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// Sets the two-factor authentication code for user authentication.
  ///
  /// The [twoFactorAuthenticationCode] is the 2FA code to set.
  ///
  /// Throws a [LexActivatorException] on error.
  static int SetTwoFactorAuthenticationCode({
    required String twoFactorAuthenticationCode,
  }) {
    int status = _lexActivatorNative.SetTwoFactorAuthenticationCode(
      twoFactorAuthenticationCode,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// Returns the product metadata for the passed [key] value, as set in the dashboard.
  ///
  /// This is available for trial as well as license activations.
  ///
  /// The function throws a [LexActivatorException] on error.

  static String GetProductMetadata({required String key}) {
    final array = calloc<Uint8>(256);
    int status = _lexActivatorNative.GetProductMetadata(
      key,
      array.cast(),
      256,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    final metadata = convertArrayToDartString(array);
    calloc.free(array);
    return metadata;
  }

  /// Returns the license entitlement set name.
  ///
  /// The function throws a [LexActivatorException] on error.
  static String GetLicenseEntitlementSetName() {
    final array = calloc<Uint8>(256);
    int status = _lexActivatorNative.GetLicenseEntitlementSetName(
      array.cast(),
      256,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    final entitlementSetName = convertArrayToDartString(array);
    calloc.free(array);
    return entitlementSetName;
  }

  /// Returns the license entitlement set display name.
  ///
  /// The function throws a [LexActivatorException] on error.
  static String GetLicenseEntitlementSetDisplayName() {
    final array = calloc<Uint8>(256);
    int status = _lexActivatorNative.GetLicenseEntitlementSetDisplayName(
      array.cast(),
      256,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    final licenseEntitlementSetDisplayName = convertArrayToDartString(array);
    calloc.free(array);
    return licenseEntitlementSetDisplayName;
  }

  ///Returns the set name of the Product Version.
  ///
  /// The function throws a [LexActivatorException] on error.
  static String GetProductVersionName() {
    final array = calloc<Uint8>(256);
    int status = _lexActivatorNative.GetProductVersionName(
      array.cast(),
      256,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    final name = convertArrayToDartString(array);
    calloc.free(array);
    return name;
  }

  ///Returns the set display name of the Product Version.
  ///
  /// The function throws a [LexActivatorException] on error.
  static String GetProductVersionDisplayName() {
    final array = calloc<Uint8>(256);
    int status = _lexActivatorNative.GetProductVersionDisplayName(
      array.cast(),
      256,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    final displayName = convertArrayToDartString(array);
    calloc.free(array);
    return displayName;
  }

  ///Returns a [ProductVersionFeatureFlag] object with the details of the product version feature flag for the passed [name].
  ///
  /// The function throws a [LexActivatorException] on error.
  static ProductVersionFeatureFlag GetProductVersionFeatureFlag(
      {required String name}) {
    final enabled = calloc<Uint32>();
    final array = calloc<Uint8>(256);

    int status = _lexActivatorNative.GetProductVersionFeatureFlag(
      name,
      enabled,
      array.cast(),
      256,
    );

    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }

    final featureFlag = ProductVersionFeatureFlag(
        name, enabled.value > 0, convertArrayToDartString(array));

    calloc.free(enabled);
    calloc.free(array);

    return featureFlag;
  }

  /// Returns the license metadata for the passed [key] value, as set in the dashboard.
  ///
  /// The function throws a [LexActivatorException] on error.

  static String GetLicenseMetadata({
    required String key,
  }) {
    final array = calloc<Uint8>(256);
    int status = _lexActivatorNative.GetLicenseMetadata(
      key,
      array.cast(),
      256,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    final metadata = convertArrayToDartString(array);
    calloc.free(array);
    return metadata.trim();
  }

  ///  Returns a [LicenseMeterAttribute] class object containing allowedUses,
  ///  totalUses, and grossUses, using the [name]
  ///  of the meter attribute.
  ///
  /// The function throws a [LexActivatorException] on error.

  static LicenseMeterAttribute GetLicenseMeterAttribute(
      {required String name}) {
    final allowedUses = calloc<Int64>();
    final totalUses = calloc<Uint64>();
    final grossUses = calloc<Uint64>();

    int status = _lexActivatorNative.GetLicenseMeterAttribute(
      name,
      allowedUses,
      totalUses,
      grossUses,
    );

    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }

    final licenseMeterAttribute = LicenseMeterAttribute(
        name, allowedUses.value, totalUses.value, grossUses.value);
    calloc.free(allowedUses);
    calloc.free(totalUses);
    calloc.free(grossUses);
    return licenseMeterAttribute;
  }

  /// Returns the license key used for activation.
  ///
  /// The function throws a [LexActivatorException] on error.

  static String GetLicenseKey() {
    final array = calloc<Uint8>(256);
    int status = _lexActivatorNative.GetLicenseKey(
      array.cast(),
      256,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    final licenseKey = convertArrayToDartString(array);
    calloc.free(array);

    return licenseKey;
  }

  /// Returns the allowed activations of the license.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int GetLicenseAllowedActivations() {
    final allowedActivations = calloc<Int64>();

    int status = _lexActivatorNative.GetLicenseAllowedActivations(
      allowedActivations,
    );

    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }

    return allowedActivations.value;
  }

  /// Returns the total activations of the license.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int GetLicenseTotalActivations() {
    final totalActivations = calloc<Uint32>();

    int status = _lexActivatorNative.GetLicenseTotalActivations(
      totalActivations,
    );

    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return totalActivations.value;
  }

  /// Gets the allowed deactivations of the license.
  /// Returns the number of allowed deactivations. A value of -1 indicates unlimited deactivations.
  ///
  /// The function throws a [LexActivatorException] on error.
  static int GetLicenseAllowedDeactivations() {
    final allowedDeactivations = calloc<Int64>();

    int status = _lexActivatorNative.GetLicenseAllowedDeactivations(
      allowedDeactivations,
    );

    try {
      switch (status) {
        case LexStatusCodes.LA_OK:
          return allowedDeactivations.value;
        case LexStatusCodes.LA_FAIL:
          return 0;
        default:
          throw LexActivatorException(status);
      }
    } finally {
      calloc.free(allowedDeactivations);
    }
  }

  /// Gets the total deactivations of the license.
  ///
  /// Returns the total number of deactivations.
  ///
  /// Throws a [LexActivatorException] on error.
  static int GetLicenseTotalDeactivations() {
    final totalDeactivations = calloc<Uint32>();
    int status = _lexActivatorNative.GetLicenseTotalDeactivations(
      totalDeactivations,
    );
    try {
      switch (status) {
        case LexStatusCodes.LA_OK:
          return totalDeactivations.value;
        case LexStatusCodes.LA_FAIL:
          return 0;
        default:
          throw LexActivatorException(status);
      }
    } finally {
      calloc.free(totalDeactivations);
    }
  }

  /// Gets the license creation date timestamp.
  ///
  /// Returns the timestamp as an integer.
  ///
  /// Throws a [LexActivatorException] on error.
  static int GetLicenseCreationDate() {
    final creationDate = calloc<Uint32>();
    int status = _lexActivatorNative.GetLicenseCreationDate(creationDate);
    try {
      switch (status) {
        case LexStatusCodes.LA_OK:
          return creationDate.value;
        case LexStatusCodes.LA_FAIL:
          return 0;
        default:
          throw LexActivatorException(status);
      }
    } finally {
      calloc.free(creationDate);
    }
  }

  /// Gets the activation creation date timestamp.
  ///
  /// Returns the timestamp as an integer.
  ///
  /// Throws a [LexActivatorException] on error.
  static int GetActivationCreationDate() {
    final creationDate = calloc<Uint32>();
    int status = _lexActivatorNative.GetActivationCreationDate(creationDate);
    try {
      switch (status) {
        case LexStatusCodes.LA_OK:
          return creationDate.value;
        case LexStatusCodes.LA_FAIL:
          return 0;
        default:
          throw LexActivatorException(status);
      }
    } finally {
      calloc.free(creationDate);
    }
  }

  /// Enables network logs.
  ///
  /// This function should be used for network testing only in case of network errors.
  /// By default logging is disabled.
  ///
  /// This function generates the lexactivator-logs.log file in the same directory
  /// where the application is running.
  ///
  /// The [flag] parameter should be 0 or 1 to disable or enable logging.
  ///
  /// Throws a [LexActivatorException] on error.
  static void SetDebugMode(int flag) {
    final status = _lexActivatorNative.SetDebugMode(flag);
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
  }

  /// Gets the activation creation date timestamp.
  ///
  /// Returns the timestamp as an integer.
  ///
  /// Throws a [LexActivatorException] on error.
  static int GetLicenseActivationDate() {
    final activationDate = calloc<Uint32>();
    int status = _lexActivatorNative.GetLicenseActivationDate(activationDate);
    try {
      switch (status) {
        case LexStatusCodes.LA_OK:
          return activationDate.value;
        case LexStatusCodes.LA_FAIL:
          return 0;
        default:
          throw LexActivatorException(status);
      }
    } finally {
      calloc.free(activationDate);
    }
  }

  /// Returns the activation last synced date timestamp.
  ///
  /// Initially, this timestamp matches the activation creation date, and then updates with each successful server sync.
  ///
  /// The function throws a [LexActivatorException] on error.
  static int GetActivationLastSyncedDate() {
    final lastSyncedDate = calloc<Uint32>();
    int status = _lexActivatorNative.GetActivationLastSyncedDate(lastSyncedDate);
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return lastSyncedDate.value;
  }

  /// Returns the license expiry date timestamp.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int GetLicenseExpiryDate() {
    final expiryDate = calloc<Uint32>();
    int status = _lexActivatorNative.GetLicenseExpiryDate(
      expiryDate,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }

    return expiryDate.value;
  }

  /// Gets the license maintenance expiry date timestamp.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int GetLicenseMaintenanceExpiryDate() {
    final expiryDate = calloc<Uint32>();
    int status = _lexActivatorNative.GetLicenseMaintenanceExpiryDate(
      expiryDate,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return expiryDate.value;
  }

  /// Returns the maximum allowed release version of the license.
  ///
  /// The function throws a [LexActivatorException] on error.

  static String GetLicenseMaxAllowedReleaseVersion() {
    final array = calloc<Uint8>(1024);

    int status = _lexActivatorNative.GetLicenseMaxAllowedReleaseVersion(
      array.cast(),
      1024,
    );

    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }

    final version = convertArrayToDartString(array);
    calloc.free(array);
    return version.trim();
  }

  /// Sets the current release version of your application.
  ///
  /// The release version appears along with the activation details in dashboard.
  /// The [releaseVersion] must be in one of the following formats: x.x, x.x.x, x.x.x.x
  ///
  /// The function throws a [LexActivatorException] on error.

  static int SetReleaseVersion({required String releaseVersion}) {
    int status = _lexActivatorNative.SetReleaseVersion(releaseVersion);
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// Returns the email associated with the license user.
  ///
  /// The function throws a [LexActivatorException] on error.

  static String GetLicenseUserEmail() {
    final array = calloc<Uint8>(256);

    int status = _lexActivatorNative.GetLicenseUserEmail(
      array.cast(),
      256,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    final licenseUserEmail = convertArrayToDartString(array);
    calloc.free(array);
    return licenseUserEmail.trim();
  }

  /// Returns the name associated with the license user.
  ///
  /// The function throws a [LexActivatorException] on error.

  static String GetLicenseUserName() {
    final array = calloc<Uint8>(256);
    int status = _lexActivatorNative.GetLicenseUserName(
      array.cast(),
      256,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    final licenseUserName = convertArrayToDartString(array);
    calloc.free(array);
    return licenseUserName.trim();
  }

  /// Returns the company associated with the license user.
  ///
  /// The function throws a [LexActivatorException] on error.

  static String GetLicenseUserCompany() {
    final array = calloc<Uint8>(256);
    int status = _lexActivatorNative.GetLicenseUserCompany(
      array.cast(),
      256,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    final licenseUserCompany = convertArrayToDartString(array);
    calloc.free(array);
    return licenseUserCompany.trim();
  }

  /// Returns the metadata associated with the license user associated with
  /// the [key].
  ///
  /// The function throws a [LexActivatorException] on error.

  static String GetLicenseUserMetadata({required String key}) {
    final array = calloc<Uint8>(256);
    int status = _lexActivatorNative.GetLicenseUserMetadata(
      key,
      array.cast(),
      256,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    final licenseUserMetadata = convertArrayToDartString(array);
    calloc.free(array);
    return licenseUserMetadata.trim();
  }

  /// Returns the organization name associated with the license.
  ///
  /// The function throws a [LexActivatorException] on error.

  static String GetLicenseOrganizationName() {
    final array = calloc<Uint8>(256);
    int status = _lexActivatorNative.GetLicenseOrganizationName(
      array.cast(),
      256,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    final licenseOrganizationName = convertArrayToDartString(array);
    calloc.free(array);
    return licenseOrganizationName.trim();
  }

  /// Gets the organization address associated with the license.
  ///
  /// Returns the license organization address as an [OrganizationAddress] object.
  ///
  /// Throws a [LexActivatorException] on error.
  static OrganizationAddress? GetLicenseOrganizationAddress() {
    final array = calloc<Uint8>(256);
    int status = _lexActivatorNative.GetLicenseOrganizationAddress(
      array.cast(),
      256,
    );
    if (status != LexStatusCodes.LA_OK) {
      throw LexActivatorException(status);
    }

    Map<String, dynamic> addressObject;
    try {
      addressObject = jsonDecode(convertArrayToDartString(array));
    } catch (_) {
      addressObject = {};
    } finally {
      calloc.free(array);
    }

    if (addressObject.isNotEmpty) {
      return OrganizationAddress(
          addressLine1: addressObject['addressLine1'],
          addressLine2: addressObject['addressLine2'],
          city: addressObject['city'],
          state: addressObject['state'],
          country: addressObject['country'],
          postalCode: addressObject['postalCode']);
    }
    return null;
  }

  /// Gets the feature entitlements for the product.
  ///
  /// Returns a list of [FeatureEntitlement] objects.
  ///
  /// The function throws a [LexActivatorException] on error.
  static List<FeatureEntitlement> GetFeatureEntitlements() {
    final array = calloc<Uint8>(4096);
    int status = _lexActivatorNative.GetFeatureEntitlements(
      array.cast(),
      4096,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    List<FeatureEntitlement> featureEntitlements;
    try {
      final List<dynamic> jsonList =
          jsonDecode(convertArrayToDartString(array));
      featureEntitlements =
          jsonList.map((json) => FeatureEntitlement.fromJson(json)).toList();
    } catch (_) {
      featureEntitlements = [];
    } finally {
      calloc.free(array);
    }
    return featureEntitlements;
  }

  /// Gets the feature entitlement for the product.
  ///
  /// Returns a [FeatureEntitlement] object.
  ///
  /// The function throws a [LexActivatorException] on error.
  static FeatureEntitlement GetFeatureEntitlement({required String featureName}) {
    final array = calloc<Uint8>(1024);
    int status = _lexActivatorNative.GetFeatureEntitlement(
      featureName,
      array.cast(),
      1024,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }

    Map<String, dynamic> featureEntitlementObject;
    try {
      featureEntitlementObject = jsonDecode(convertArrayToDartString(array));
    } catch (_) {
      featureEntitlementObject = {};
    } finally {
      calloc.free(array);
    }
    return FeatureEntitlement.fromJson(featureEntitlementObject);
  }

  /// Gets the user licenses for the product.
  ///
  /// This function sends a network request to Cryptlex servers to get the licenses.
  /// Make sure [AuthenticateUser] function is called before calling this function.
  ///
  /// Returns a list of [UserLicense] objects.
  ///
  /// The function throws a [LexActivatorException] on error.
  static List<UserLicense> GetUserLicenses() {
    final array = calloc<Uint8>(4096);
    int status = _lexActivatorNative.GetUserLicenses(
      array.cast(),
      4096,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }

    List<UserLicense> userLicenses;
    try {
      final List<dynamic> jsonList =
          jsonDecode(convertArrayToDartString(array));
      userLicenses =
          jsonList.map((json) => UserLicense.fromJson(json)).toList();
    } catch (_) {
      userLicenses = [];
    } finally {
      calloc.free(array);
    }
    return userLicenses;
  }

  /// Returns the license type (node-locked or hosted-floating).
  ///
  /// The function throws a [LexActivatorException] on error.

  static String GetLicenseType() {
    final array = calloc<Uint8>(256);
    int status = _lexActivatorNative.GetLicenseType(
      array.cast(),
      256,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    final licenseType = convertArrayToDartString(array);
    calloc.free(array);
    return licenseType.trim();
  }

  /// Gets the activation Id.
  ///
  /// Returns the activation Id as a String.
  ///
  /// The function throws a [LexActivatorException] on error.
  static String GetActivationId() {
    final array = calloc<Uint8>(1024);
    int status = _lexActivatorNative.GetActivationId(
      array.cast(),
      1024,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    final activationId = convertArrayToDartString(array);
    calloc.free(array);
    return activationId.trim();
  }

  /// Returns the activation metadata associated with the [key].
  ///
  /// The function throws a [LexActivatorException] on error.

  static String GetActivationMetadata(String key) {
    final array = calloc<Uint8>(256);
    int status = _lexActivatorNative.GetActivationMetadata(
      key,
      array.cast(),
      256,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    final activationMetadata = convertArrayToDartString(array);
    calloc.free(array);
    return activationMetadata.trim();
  }

  /// Gets the initial and current mode of activation (online or offline).
  ///
  /// The function throws a [LexActivatorException] on error.

  static ActivationMode GetActivationMode() {
    final initialModeArray = calloc<Uint8>(256);
    final currentModeArray = calloc<Uint8>(256);
    int status = _lexActivatorNative.GetActivationMode(
      initialModeArray.cast(),
      256,
      currentModeArray.cast(),
      256,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    final initialMode = convertArrayToDartString(initialModeArray);
    final currentMode = convertArrayToDartString(currentModeArray);
    calloc.free(initialModeArray);
    calloc.free(currentModeArray);
    final activationMode = ActivationMode(initialMode, currentMode);
    return activationMode;
  }

  /// Returns the meter attribute uses consumed by the activation associated
  /// with the meter attribute [name].
  ///
  /// The function throws a [LexActivatorException] on error.

  static int GetActivationMeterAttributeUses({
    required String name,
  }) {
    final uses = calloc<Uint32>();
    int status = _lexActivatorNative.GetActivationMeterAttributeUses(
      name,
      uses,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return uses.value;
  }

  /// Returns the server sync grace period expiry date timestamp.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int GetServerSyncGracePeriodExpiryDate() {
    final expiryDate = calloc<Uint32>();
    int status = _lexActivatorNative.GetServerSyncGracePeriodExpiryDate(
      expiryDate,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return expiryDate.value;
  }

  /// Returns the trial activation metadata associated with the [key];
  ///
  /// The function throws a [LexActivatorException] on error.

  static String GetTrialActivationMetadata({required String key}) {
    final array = calloc<Uint8>(256);

    int status = _lexActivatorNative.GetTrialActivationMetadata(
      key,
      array.cast(),
      256,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    final trialActivationMetadata = convertArrayToDartString(array);
    calloc.free(array);
    return trialActivationMetadata.trim();
  }

  /// Returns the trial expiry date timestamp.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int GetTrialExpiryDate() {
    final trialExpiryDate = calloc<Uint32>();
    int status = _lexActivatorNative.GetTrialExpiryDate(trialExpiryDate);
    switch (status) {
      case LexStatusCodes.LA_OK:
        return trialExpiryDate.value;
      case LexStatusCodes.LA_FAIL:
        return 0;
      default:
        throw LexActivatorException(status);
    }
  }

  /// Returns the trial activation ID to be used in case of trial extensions.
  ///
  /// The function throws a [LexActivatorException] on error.

  static String GetTrialId() {
    final array = calloc<Uint8>(256);

    int status = _lexActivatorNative.GetTrialId(array.cast(), 256);
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }

    final trialId = convertArrayToDartString(array);
    calloc.free(array);
    return trialId.trim();
  }

  /// Returns the local trial expiry date timestamp.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int GetLocalTrialExpiryDate() {
    final trialExpiryDate = calloc<Uint32>();

    int status = _lexActivatorNative.GetLocalTrialExpiryDate(trialExpiryDate);
    switch (status) {
      case LexStatusCodes.LA_OK:
        return trialExpiryDate.value;
      case LexStatusCodes.LA_FAIL:
        return 0;
      default:
        throw LexActivatorException(status);
    }
  }

  /// Returns the version of this library.
  ///
  /// The function throws a [LexActivatorException] on error.

  static String GetLibraryVersion() {
    final array = calloc<Uint8>(256);
    int status = _lexActivatorNative.GetLibraryVersion(
      array.cast(),
      256,
    );

    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }

    final libraryName = convertArrayToDartString(array);
    calloc.free(array);
    return libraryName;
  }

  /// Checks whether a new release is available for the product.
  ///
  /// This function should only be used if you manage your releases through
  /// Cryptlex release management API.
  ///
  /// When this function is called the release update callback function gets invoked
  /// which passes the following parameters:
  ///
  /// status - determines if any update is available or not. It also determines whether
  /// an update is allowed or not. Expected values are LA_RELEASE_UPDATE_AVAILABLE,
  /// LA_RELEASE_UPDATE_NOT_AVAILABLE, LA_RELEASE_UPDATE_AVAILABLE_NOT_ALLOWED.
  ///
  /// release - object of the latest available release, the object passed depends on the
  /// flag LA_RELEASES_ALLOWED or LA_RELEASES_ALL provided to the CheckReleaseUpdate().
  ///
  /// userData - data that is passed to the callback function when it is registered
  /// using the CheckReleaseUpdate function. This parameter is optional and can be null if no user data
  /// is passed to the CheckReleaseUpdate function.
  ///
  /// The function throws a [LexActivatorException] on error.
  /// A callback function for CheckReleaseUpdate().
  ///
  /// [status] - status of an update.
  /// [release] - release object.
  /// [userData] - user defined data.
  //

// static int CheckReleaseUpdate({
//     required CallbackFuncReleaseUpdateDart releaseUpdateCallback,
//     required int flag,
//     dynamic userData,
//   }) {
//     late final NativeCallable<CallbackFuncReleaseUpdate> callback;

//     void internalReleaseUpdateCallback(
//         int status, Pointer<Utf8> releaseJson, Pointer<Void> userDataPtr) {
//       Release? release;
//       String? jsonString;

//       try {
//         jsonString = releaseJson.cast<Utf8>().toDartString();
//         if (jsonString.isNotEmpty) {}
//       } catch (_) {}

//       // Call the user's callback
//       releaseUpdateCallback(status, release, userData);
//       callback.close(); // Close the NativeCallable when done
//     }

//     // Create the NativeCallable
//     callback = NativeCallable<CallbackFuncReleaseUpdate>.listener(
//         internalReleaseUpdateCallback);

//     // Call the native function with the nativeFunction property
//     int status = _lexActivatorNative.CheckReleaseUpdate(
//       callback,
//       flag,
//     );

//     if (LexStatusCodes.LA_OK != status) {
//       callback.close(); // Clean up if there's an error
//       throw LexActivatorException(status);
//     }

//     return status;
//   }

  // /// Checks whether a new release is available for the product.
  // ///
  // /// This check is preformed based on the release [platform] like windows.
  // /// [version] is the current release version. [channel] is the Release
  // /// Channel. [releaseUpdateCallback] listens to the release update event.
  // ///
  // /// This function should only be used if you manage your releases through
  // /// Cryptlex release management API.
  // ///
  // /// The function throws a [LexActivatorException] on error.

  static int CheckForReleaseUpdate({
    required String platform,
    required String version,
    required String channel,
    required ReleaseCallbackFuncDart releaseUpdateCallback,
  }) {
    late final NativeCallable<ReleaseCallbackFunc> lcallback;
    void internalCallback(int status) {
      releaseUpdateCallback(status);
      lcallback.close();
    }

    lcallback = NativeCallable<ReleaseCallbackFunc>.listener(internalCallback);
    int status = _lexActivatorNative.CheckForReleaseUpdate(
      platform,
      version,
      channel,
      lcallback.nativeFunction,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return 0;
  }

  /// Sends the request to the Cryptlex servers to authenticate the user.
  ///
  /// [email] is the user's email address
  /// [password] is the user's password
  ///
  /// Returns [LexStatusCodes] LA_OK
  ///
  /// The function throws a [LexActivatorException] on error.

  static int AuthenticateUser({
    required String email,
    required String password,
  }) {
    int status = _lexActivatorNative.AuthenticateUser(
      email,
      password,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// Authenticates the user via OIDC Id token.
  ///
  /// [idToken] is the id token obtained from the OIDC provider.
  ///
  /// Returns [LexStatusCodes] LA_OK
  ///
  /// The function throws a [LexActivatorException] on error.
  static int AuthenticateUserWithIdToken({
    required String idToken,
  }) {
    int status = _lexActivatorNative.AuthenticateUserWithIdToken(
      idToken,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// Activates the license by contacting the Cryptlex servers.
  ///
  /// Returns [LexStatusCodes] LA_OK, LA_EXPIRED, LA_SUSPENDED, and LA_FAIL.
  ///
  /// It validates the key and returns with encrypted and digitally signed token
  /// which it stores and uses to activate your application.
  /// This function should be executed at the time of registration, ideally on a
  /// button click.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int ActivateLicense() {
    int status = _lexActivatorNative.ActivateLicense();
    switch (status) {
      case LexStatusCodes.LA_OK:
        return LexStatusCodes.LA_OK;
      case LexStatusCodes.LA_EXPIRED:
        return LexStatusCodes.LA_EXPIRED;
      case LexStatusCodes.LA_SUSPENDED:
        return LexStatusCodes.LA_SUSPENDED;
      case LexStatusCodes.LA_FAIL:
        return LexStatusCodes.LA_FAIL;
      default:
        throw LexActivatorException(status);
    }
  }

  /// Activates your application using the offline activation response file.
  /// Requires [filePath] to the response file.
  ///
  /// Returns [LexStatusCodes] LA_OK, LA_EXPIRED, LA_SUSPENDED, and LA_FAIL
  ///
  /// The function throws a [LexActivatorException] on error.

  static int ActivateLicenseOffline({required String filePath}) {
    int status = _lexActivatorNative.ActivateLicenseOffline(
      filePath,
    );
    switch (status) {
      case LexStatusCodes.LA_OK:
        return LexStatusCodes.LA_OK;
      case LexStatusCodes.LA_EXPIRED:
        return LexStatusCodes.LA_EXPIRED;
      case LexStatusCodes.LA_SUSPENDED:
        return LexStatusCodes.LA_SUSPENDED;
      case LexStatusCodes.LA_FAIL:
        return LexStatusCodes.LA_FAIL;
      default:
        throw LexActivatorException(status);
    }
  }

  /// Generates the offline activation request needed for generating offline
  /// activation response in the dashboard. Requires [filePath] of where the file
  /// is to be created.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int GenerateOfflineActivationRequest({required String filePath}) {
    int status = _lexActivatorNative.GenerateOfflineActivationRequest(
      filePath,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// Deactivates the license activation and frees up the correponding activation
  /// slot by contacting the Cryptlex servers.
  /// This function should be executed at the time of deregistration, ideally on a
  /// button click.
  ///
  /// Returns [LexStatusCodes] LA_OK, and LA_FAIL.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int DeactivateLicense() {
    int status = _lexActivatorNative.DeactivateLicense();
    switch (status) {
      case LexStatusCodes.LA_OK:
        return LexStatusCodes.LA_OK;
      case LexStatusCodes.LA_FAIL:
        return LexStatusCodes.LA_FAIL;
      default:
        throw LexActivatorException(status);
    }
  }

  /// Generates the offline deactivation request file needed for deactivation of the
  /// license in the dashboard at [filePath] and deactivates the license locally.
  ///
  /// A valid offline deactivation file confirms that the license has been
  /// successfully deactivated on the user's machine.
  ///
  /// Returns [LexStatusCodes] LA_OK, and LA_FAIL.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int GenerateOfflineDeactivationRequest({
    required String filePath,
  }) {
    int status = _lexActivatorNative.GenerateOfflineDeactivationRequest(
      filePath,
    );
    switch (status) {
      case LexStatusCodes.LA_OK:
        return LexStatusCodes.LA_OK;
      case LexStatusCodes.LA_FAIL:
        return LexStatusCodes.LA_FAIL;
      default:
        throw LexActivatorException(status);
    }
  }

  /// It verifies whether your app is genuinely activated or not.
  /// Returns [LexStatusCodes] LA_OK, LA_EXPIRED, LA_SUSPENDED, LA_GRACE_PERIOD_OVER, and LA_FAIL.
  ///
  /// The verification is done locally by verifying the cryptographic digital
  /// signature fetched at the time of activation.
  /// After verifying locally, it schedules a server check in a separate thread.
  /// After the first server sync it periodically does further syncs at a frequency
  /// set for the license.
  ///
  /// In case server sync fails due to network error, and it continues to fail for
  /// fixed number of days (grace period), the function returns
  /// LA_GRACE_PERIOD_OVER instead of LA_OK.
  /// This function must be called on every start of your program to verify the
  /// activation of your app.
  ///
  /// __Note:__ If application was activated offline using
  /// [ActivateLicenseOffline()] function, you may want to set grace period to 0 to
  /// ignore grace period.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int IsLicenseGenuine() {
    int status = _lexActivatorNative.IsLicenseGenuine();

    switch (status) {
      case LexStatusCodes.LA_OK:
        return LexStatusCodes.LA_OK;
      case LexStatusCodes.LA_EXPIRED:
        return LexStatusCodes.LA_EXPIRED;
      case LexStatusCodes.LA_SUSPENDED:
        return LexStatusCodes.LA_SUSPENDED;
      case LexStatusCodes.LA_GRACE_PERIOD_OVER:
        return LexStatusCodes.LA_GRACE_PERIOD_OVER;
      case LexStatusCodes.LA_FAIL:
        return LexStatusCodes.LA_FAIL;
      default:
        throw LexActivatorException(status);
    }
  }

  /// It verifies whether your app is genuinely activated or not.
  /// Returns [LexStatusCodes] LA_OK, LA_EXPIRED, LA_SUSPENDED, LA_GRACE_PERIOD_OVER, and LA_FAIL
  ///
  /// The verification is done locally by verifying the cryptographic digital signature
  /// fetched at the time of activation.
  /// This is just an auxiliary function which you may use in some specific cases,
  /// when you want to skip the server sync.
  /// __Note:__ You may want to set grace period to 0 to ignore grace period.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int IsLicenseValid() {
    int status = _lexActivatorNative.IsLicenseValid();
    switch (status) {
      case LexStatusCodes.LA_OK:
        return LexStatusCodes.LA_OK;
      case LexStatusCodes.LA_EXPIRED:
        return LexStatusCodes.LA_EXPIRED;
      case LexStatusCodes.LA_SUSPENDED:
        return LexStatusCodes.LA_SUSPENDED;
      case LexStatusCodes.LA_GRACE_PERIOD_OVER:
        return LexStatusCodes.LA_GRACE_PERIOD_OVER;
      case LexStatusCodes.LA_FAIL:
        return LexStatusCodes.LA_FAIL;
      default:
        throw LexActivatorException(status);
    }
  }

  /// Starts the verified trial in your application by contacting the Cryptlex
  /// servers.
  /// Returns [LexStatusCodes] LA_OK, LA_TRIAL_EXPIRED
  ///
  /// This function should be executed when your application starts first time on
  /// the user's computer, ideally on a button click.
  /// __Note:__ This function is only meant for verified trials.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int ActivateTrial() {
    int status = _lexActivatorNative.ActivateTrial();
    switch (status) {
      case LexStatusCodes.LA_OK:
        return LexStatusCodes.LA_OK;
      case LexStatusCodes.LA_TRIAL_EXPIRED:
        return LexStatusCodes.LA_TRIAL_EXPIRED;
      case LexStatusCodes.LA_FAIL:
        return LexStatusCodes.LA_FAIL;
      default:
        throw LexActivatorException(status);
    }
  }

  /// Activates the trial using the offline activation response file at
  /// [filePath]
  ///
  /// Returns [LexStatusCodes] LA_OK, LA_TRIAL_EXPIRED, and LA_FAIL.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int ActivateTrialOffline({
    required String filePath,
  }) {
    int status = _lexActivatorNative.ActivateTrialOffline(
      filePath,
    );
    switch (status) {
      case LexStatusCodes.LA_OK:
        return LexStatusCodes.LA_OK;
      case LexStatusCodes.LA_TRIAL_EXPIRED:
        return LexStatusCodes.LA_TRIAL_EXPIRED;
      case LexStatusCodes.LA_FAIL:
        return LexStatusCodes.LA_FAIL;
      default:
        throw LexActivatorException(status);
    }
  }

  /// Generates the offline trial activation request at [filePath] needed for
  /// generating offline trial activation response in the dashboard.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int GenerateOfflineTrialActivationRequest({
    required String filePath,
  }) {
    int status = _lexActivatorNative.GenerateOfflineTrialActivationRequest(
      filePath,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// It verifies whether trial has started and is genuine or not.
  ///
  /// Returns [LexStatusCodes] LA_OK, LA_TRIAL_EXPIRED, and LA_FAIL.
  ///
  /// The verification is done locally by verifying the cryptographic digital
  /// signature fetched at the time of trial activation.
  /// This function must be called on every start of your program during the trial
  /// period.
  /// __Note:__ This function is only meant for verified trials.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int IsTrialGenuine() {
    int status = _lexActivatorNative.IsTrialGenuine();
    switch (status) {
      case LexStatusCodes.LA_OK:
        return LexStatusCodes.LA_OK;
      case LexStatusCodes.LA_TRIAL_EXPIRED:
        return LexStatusCodes.LA_TRIAL_EXPIRED;
      case LexStatusCodes.LA_FAIL:
        return LexStatusCodes.LA_FAIL;
      default:
        throw LexActivatorException(status);
    }
  }

  /// Starts the local(unverified) trial for [trialLength] days.
  ///
  /// Returns [LexStatusCodes] LA_OK, LA_LOCAL_TRIAL_EXPIRED, and LA_FAIL
  ///
  /// This function should be executed when your application starts first time on
  /// the user's computer, ideally on a button click.
  /// __Note:__ The function is only meant for local(unverified) trials.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int ActivateLocalTrial({
    required int trialLength,
  }) {
    int status = _lexActivatorNative.ActivateLocalTrial(
      trialLength,
    );
    switch (status) {
      case LexStatusCodes.LA_OK:
        return LexStatusCodes.LA_OK;
      case LexStatusCodes.LA_LOCAL_TRIAL_EXPIRED:
        return LexStatusCodes.LA_LOCAL_TRIAL_EXPIRED;
      case LexStatusCodes.LA_FAIL:
        return LexStatusCodes.LA_FAIL;
      default:
        throw LexActivatorException(status);
    }
  }

  /// It verifies whether trial has started and is genuine or not. The verification
  /// is done locally.
  ///
  /// Returns [LexStatusCodes] LA_OK, LA_LOCAL_TRIAL_EXPIRED, and LA_FAIL.
  ///
  /// This function must be called on every start of your program during the trial
  /// period.
  /// __Note:__ The function is only meant for local(unverified) trials.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int IsLocalTrialGenuine() {
    int status = _lexActivatorNative.IsLocalTrialGenuine();
    switch (status) {
      case LexStatusCodes.LA_OK:
        return LexStatusCodes.LA_OK;
      case LexStatusCodes.LA_LOCAL_TRIAL_EXPIRED:
        return LexStatusCodes.LA_LOCAL_TRIAL_EXPIRED;
      case LexStatusCodes.LA_FAIL:
        return LexStatusCodes.LA_FAIL;
      default:
        throw LexActivatorException(status);
    }
  }

  /// Extends the local trial by [trialExtensionLength] days.
  ///
  /// Returns [LexStatusCodes] LA_OK, and LA_FAIL.
  /// __Note:__ This function is only meant for unverified trials.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int ExtendLocalTrial({
    required int trialExtensionLength,
  }) {
    int status = _lexActivatorNative.ExtendLocalTrial(
      trialExtensionLength,
    );
    switch (status) {
      case LexStatusCodes.LA_OK:
        return LexStatusCodes.LA_OK;
      case LexStatusCodes.LA_FAIL:
        return LexStatusCodes.LA_FAIL;
      default:
        throw LexActivatorException(status);
    }
  }

  /// Increments the meter attribute uses of the activation named [name] by [increment].
  ///
  /// The function throws a [LexActivatorException] on error.

  static int IncrementActivationMeterAttributeUses(
      {required String name, required int increment}) {
    int status = _lexActivatorNative.IncrementActivationMeterAttributeUses(
      name,
      increment,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// Decrements the meter attribute uses of the activation named [name] by [decrement].
  ///
  /// The function throws a [LexActivatorException] on error.

  static int DecrementActivationMeterAttributeUses({
    required String name,
    required int decrement,
  }) {
    int status = _lexActivatorNative.DecrementActivationMeterAttributeUses(
      name,
      decrement,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// Resets the meter attribute uses of the activation named [name].
  ///
  /// The function throws a [LexActivatorException] on error.

  static int ResetActivationMeterAttributeUses({
    required String name,
  }) {
    int status = _lexActivatorNative.ResetActivationMeterAttributeUses(
      name,
    );
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// Resets the activation and trial data stored in the machine.
  /// This function is meant for developer testing only.
  /// __Note:__ The function does not reset local(unverified) trial data.
  ///
  /// The function throws a [LexActivatorException] on error.

  static int Reset() {
    int status = _lexActivatorNative.Reset();
    if (LexStatusCodes.LA_OK != status) {
      throw LexActivatorException(status);
    }
    return status;
  }

  /// Function used to internally load dynamic libraries.
  /// For developer use only.

  static DynamicLibrary loadLib() {
    // final libraryPathURI = File(Platform.resolvedExecutable).parent.uri;
    // Is no longer required to access paths. Debugging only.

    if (Platform.isLinux) {
      return DynamicLibrary.open('libLexActivator.so');
    } else if (Platform.isWindows) {
      return DynamicLibrary.open('LexActivator.dll');
    } else if (Platform.isMacOS) {
      return DynamicLibrary.open('libLexActivator.dylib');
    } else if (Platform.isAndroid) {
      return DynamicLibrary.open('libLexActivator.so');
    } else if (Platform.isIOS) {
      return DynamicLibrary.open('LexActivator.framework/LexActivator');
    } else {
      throw Exception();
    }
  }

  /// Converts Pointer to Array to a String usable in Dart

  static String convertArrayToDartString(Pointer charPtr) {
    if (Platform.isWindows) {
      return charPtr.cast<Utf16>().toDartString();
    }
    return charPtr.cast<Utf8>().toDartString();
  }

  // static void licenseCallback(int status) {
  //   switch (status) {
  //     case LexStatusCodes.LA_OK:
  //     case LexStatusCodes.LA_EXPIRED:
  //     case LexStatusCodes.LA_SUSPENDED:
  //       print('License is genuinely activated!: $status');
  //       break;
  //     default:
  //       throw LexActivatorException(status);
  //   }
  // }
}
