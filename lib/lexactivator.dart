// ignore_for_file: non_constant_identifier_names, constant_identifier_names

///LexActivator wrapper for Dart and Flutter. The library lex_activator
///is part of the lex_activator package.
library lexactivator;

import 'dart:io';
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'src/lexactivator_native.dart';

part 'src/lexactivator_exception.dart';
part 'src/lex_status_codes.dart';
part 'src/license_meter_attribute.dart';

class LexActivator {
  ///TODO
  static const int LA_USER = 1;

  ///TODO
  static const int LA_SYSTEM = 2;

  ///TODO
  static const int LA_IN_MEMORY = 4;

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

  // /// Sets server sync [callback] function.
  // ///
  // /// Whenever the server sync occurs in a separate thread, and server returns the
  // /// response, event listener function gets invoked with the following [LexStatusCodes]:
  // ///
  // /// LA_OK, LA_EXPIRED, LA_SUSPENDED, LA_E_REVOKED,
  // /// LA_E_ACTIVATION_NOT_FOUND, LA_E_MACHINE_FINGERPRINT LA_E_COUNTRY, LA_E_INET,
  // /// LA_E_SERVER, LA_E_RATE_LIMIT, LA_E_IP
  // ///
  // /// The function throws a [LexActivatorException] on error.

  // static int SetLicenseCallback({required CallbackFuncDart callback}) {
  //   Pointer<NativeFunction<CallbackFunc>> pointer = Pointer.fromFunction(callback);

  //   int status = _lexActivatorNative.SetLicenseCallback(
  //     pointer,
  //   );
  //   if (LexStatusCodes.LA_OK != status) {
  //     throw LexActivatorException(status);
  //   }
  //   return status;
  // }

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
    final allowedUses = calloc<Uint32>();
    final totalUses = calloc<Uint32>();
    final grossUses = calloc<Uint32>();

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
    final allowedActivations = calloc<Uint32>();

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

  // static int CheckForReleaseUpdate({
  //   required String platform,
  //   required String version,
  //   required String channel,
  //   required CallbackType releaseUpdateCallback,
  // }) {
  //   int status = _lexActivatorNative.CheckForReleaseUpdate(
  //     platform,
  //     version,
  //     channel,
  //     releaseUpdateCallback,
  //   );
  //   if (LexStatusCodes.LA_OK != status) {
  //     throw LexActivatorException(status);
  //   }
  //   return 0;
  // }

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
    final libraryPathURI = File(Platform.resolvedExecutable).parent.uri;
    if (Platform.isLinux) {
      return DynamicLibrary.open(
          libraryPathURI.resolve('lib/libLexActivator.so').path);
    } else if (Platform.isWindows) {
      return DynamicLibrary.open(Platform.script
          .resolve("build/windows/Runner/Debug/LexActivator.dll")
          .toFilePath(windows: true));
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
