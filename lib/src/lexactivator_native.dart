// ignore_for_file: non_constant_identifier_names, camel_case_types, constant_identifier_names
import 'dart:ffi';
import 'package:ffi/ffi.dart';

class LexActivatorNative {
  final Pointer<T> Function<T extends NativeType>(String symbolName) _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  LexActivatorNative(DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  LexActivatorNative.fromLookup(
      Pointer<T> Function<T extends NativeType>(String symbolName) lookup)
      : _lookup = lookup;

  int SetProductFile(
    CSTRTYPE filePath,
  ) {
    return _SetProductFile(
      filePath,
    );
  }

  late final _SetProductFilePtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>('SetProductFile');
  late final _SetProductFile =
      _SetProductFilePtr.asFunction<int Function(CSTRTYPE)>();

  int SetProductData(
    CSTRTYPE productData,
  ) {
    return _SetProductData(
      productData,
    );
  }

  late final _SetProductDataPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>('SetProductData');
  late final _SetProductData =
      _SetProductDataPtr.asFunction<int Function(CSTRTYPE)>();

  int SetProductId(
    CSTRTYPE productId,
    int flags,
  ) {
    return _SetProductId(
      productId,
      flags,
    );
  }

  late final _SetProductIdPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, Uint32)>>('SetProductId');
  late final _SetProductId =
      _SetProductIdPtr.asFunction<int Function(CSTRTYPE, int)>();

  int SetDataDirectory(
    CSTRTYPE directoryPath,
  ) {
    return _SetDataDirectory(
      directoryPath,
    );
  }

  late final _SetDataDirectoryPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>('SetDataDirectory');
  late final _SetDataDirectory =
      _SetDataDirectoryPtr.asFunction<int Function(CSTRTYPE)>();

  int SetCustomDeviceFingerprint(
    CSTRTYPE fingerprint,
  ) {
    return _SetCustomDeviceFingerprint(
      fingerprint,
    );
  }

  late final _SetCustomDeviceFingerprintPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>(
          'SetCustomDeviceFingerprint');
  late final _SetCustomDeviceFingerprint =
      _SetCustomDeviceFingerprintPtr.asFunction<int Function(CSTRTYPE)>();

  int SetLicenseKey(
    CSTRTYPE licenseKey,
  ) {
    return _SetLicenseKey(
      licenseKey,
    );
  }

  late final _SetLicenseKeyPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>('SetLicenseKey');
  late final _SetLicenseKey =
      _SetLicenseKeyPtr.asFunction<int Function(CSTRTYPE)>();

  int SetLicenseUserCredential(
    CSTRTYPE email,
    CSTRTYPE password,
  ) {
    return _SetLicenseUserCredential(
      email,
      password,
    );
  }

  late final _SetLicenseUserCredentialPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, CSTRTYPE)>>(
          'SetLicenseUserCredential');
  late final _SetLicenseUserCredential = _SetLicenseUserCredentialPtr
      .asFunction<int Function(CSTRTYPE, CSTRTYPE)>();

  int SetLicenseCallback(
    CallbackType callback,
  ) {
    return _SetLicenseCallback(
      callback,
    );
  }

  late final _SetLicenseCallbackPtr =
      _lookup<NativeFunction<Int32 Function(CallbackType)>>(
          'SetLicenseCallback');
  late final _SetLicenseCallback =
      _SetLicenseCallbackPtr.asFunction<int Function(CallbackType)>();

  int SetActivationMetadata(
    CSTRTYPE key,
    CSTRTYPE value,
  ) {
    return _SetActivationMetadata(
      key,
      value,
    );
  }

  late final _SetActivationMetadataPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, CSTRTYPE)>>(
          'SetActivationMetadata');
  late final _SetActivationMetadata =
      _SetActivationMetadataPtr.asFunction<int Function(CSTRTYPE, CSTRTYPE)>();

  int SetTrialActivationMetadata(
    CSTRTYPE key,
    CSTRTYPE value,
  ) {
    return _SetTrialActivationMetadata(
      key,
      value,
    );
  }

  late final _SetTrialActivationMetadataPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, CSTRTYPE)>>(
          'SetTrialActivationMetadata');
  late final _SetTrialActivationMetadata = _SetTrialActivationMetadataPtr
      .asFunction<int Function(CSTRTYPE, CSTRTYPE)>();

  int SetAppVersion(
    CSTRTYPE appVersion,
  ) {
    return _SetAppVersion(
      appVersion,
    );
  }

  late final _SetAppVersionPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>('SetAppVersion');
  late final _SetAppVersion =
      _SetAppVersionPtr.asFunction<int Function(CSTRTYPE)>();

  int SetOfflineActivationRequestMeterAttributeUses(
    CSTRTYPE name,
    int uses,
  ) {
    return _SetOfflineActivationRequestMeterAttributeUses(
      name,
      uses,
    );
  }

  late final _SetOfflineActivationRequestMeterAttributeUsesPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, Uint32)>>(
          'SetOfflineActivationRequestMeterAttributeUses');
  late final _SetOfflineActivationRequestMeterAttributeUses =
      _SetOfflineActivationRequestMeterAttributeUsesPtr.asFunction<
          int Function(CSTRTYPE, int)>();

  int SetNetworkProxy(
    CSTRTYPE proxy,
  ) {
    return _SetNetworkProxy(
      proxy,
    );
  }

  late final _SetNetworkProxyPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>('SetNetworkProxy');
  late final _SetNetworkProxy =
      _SetNetworkProxyPtr.asFunction<int Function(CSTRTYPE)>();

  int SetCryptlexHost(
    CSTRTYPE host,
  ) {
    return _SetCryptlexHost(
      host,
    );
  }

  late final _SetCryptlexHostPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>('SetCryptlexHost');
  late final _SetCryptlexHost =
      _SetCryptlexHostPtr.asFunction<int Function(CSTRTYPE)>();

  int GetProductMetadata(
    CSTRTYPE key,
    STRTYPE value,
    int length,
  ) {
    return _GetProductMetadata(
      key,
      value,
      length,
    );
  }

  late final _GetProductMetadataPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, STRTYPE, Uint32)>>(
          'GetProductMetadata');
  late final _GetProductMetadata =
      _GetProductMetadataPtr.asFunction<int Function(CSTRTYPE, STRTYPE, int)>();

  int GetLicenseMetadata(
    CSTRTYPE key,
    STRTYPE value,
    int length,
  ) {
    return _GetLicenseMetadata(
      key,
      value,
      length,
    );
  }

  late final _GetLicenseMetadataPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, STRTYPE, Uint32)>>(
          'GetLicenseMetadata');
  late final _GetLicenseMetadata =
      _GetLicenseMetadataPtr.asFunction<int Function(CSTRTYPE, STRTYPE, int)>();

  int GetLicenseMeterAttribute(
    CSTRTYPE name,
    Pointer<Uint32> allowedUses,
    Pointer<Uint32> totalUses,
    Pointer<Uint32> grossUses,
  ) {
    return _GetLicenseMeterAttribute(
      name,
      allowedUses,
      totalUses,
      grossUses,
    );
  }

  late final _GetLicenseMeterAttributePtr = _lookup<
      NativeFunction<
          Int32 Function(CSTRTYPE, Pointer<Uint32>, Pointer<Uint32>,
              Pointer<Uint32>)>>('GetLicenseMeterAttribute');
  late final _GetLicenseMeterAttribute =
      _GetLicenseMeterAttributePtr.asFunction<
          int Function(
              CSTRTYPE, Pointer<Uint32>, Pointer<Uint32>, Pointer<Uint32>)>();

  int GetLicenseKey(
    STRTYPE licenseKey,
    int length,
  ) {
    return _GetLicenseKey(
      licenseKey,
      length,
    );
  }

  late final _GetLicenseKeyPtr =
      _lookup<NativeFunction<Int32 Function(STRTYPE, Uint32)>>('GetLicenseKey');
  late final _GetLicenseKey =
      _GetLicenseKeyPtr.asFunction<int Function(STRTYPE, int)>();

  int GetLicenseAllowedActivations(
    Pointer<Uint32> allowedActivations,
  ) {
    return _GetLicenseAllowedActivations(
      allowedActivations,
    );
  }

  late final _GetLicenseAllowedActivationsPtr =
      _lookup<NativeFunction<Int32 Function(Pointer<Uint32>)>>(
          'GetLicenseAllowedActivations');
  late final _GetLicenseAllowedActivations = _GetLicenseAllowedActivationsPtr
      .asFunction<int Function(Pointer<Uint32>)>();

  int GetLicenseTotalActivations(
    Pointer<Uint32> totalActivations,
  ) {
    return _GetLicenseTotalActivations(
      totalActivations,
    );
  }

  late final _GetLicenseTotalActivationsPtr =
      _lookup<NativeFunction<Int32 Function(Pointer<Uint32>)>>(
          'GetLicenseTotalActivations');
  late final _GetLicenseTotalActivations = _GetLicenseTotalActivationsPtr
      .asFunction<int Function(Pointer<Uint32>)>();

  int GetLicenseExpiryDate(
    Pointer<Uint32> expiryDate,
  ) {
    return _GetLicenseExpiryDate(
      expiryDate,
    );
  }

  late final _GetLicenseExpiryDatePtr =
      _lookup<NativeFunction<Int32 Function(Pointer<Uint32>)>>(
          'GetLicenseExpiryDate');
  late final _GetLicenseExpiryDate =
      _GetLicenseExpiryDatePtr.asFunction<int Function(Pointer<Uint32>)>();

  int GetLicenseUserEmail(
    STRTYPE email,
    int length,
  ) {
    return _GetLicenseUserEmail(
      email,
      length,
    );
  }

  late final _GetLicenseUserEmailPtr =
      _lookup<NativeFunction<Int32 Function(STRTYPE, Uint32)>>(
          'GetLicenseUserEmail');
  late final _GetLicenseUserEmail =
      _GetLicenseUserEmailPtr.asFunction<int Function(STRTYPE, int)>();

  int GetLicenseUserName(
    STRTYPE name,
    int length,
  ) {
    return _GetLicenseUserName(
      name,
      length,
    );
  }

  late final _GetLicenseUserNamePtr =
      _lookup<NativeFunction<Int32 Function(STRTYPE, Uint32)>>(
          'GetLicenseUserName');
  late final _GetLicenseUserName =
      _GetLicenseUserNamePtr.asFunction<int Function(STRTYPE, int)>();

  int GetLicenseUserCompany(
    STRTYPE company,
    int length,
  ) {
    return _GetLicenseUserCompany(
      company,
      length,
    );
  }

  late final _GetLicenseUserCompanyPtr =
      _lookup<NativeFunction<Int32 Function(STRTYPE, Uint32)>>(
          'GetLicenseUserCompany');
  late final _GetLicenseUserCompany =
      _GetLicenseUserCompanyPtr.asFunction<int Function(STRTYPE, int)>();

  int GetLicenseUserMetadata(
    CSTRTYPE key,
    STRTYPE value,
    int length,
  ) {
    return _GetLicenseUserMetadata(
      key,
      value,
      length,
    );
  }

  late final _GetLicenseUserMetadataPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, STRTYPE, Uint32)>>(
          'GetLicenseUserMetadata');
  late final _GetLicenseUserMetadata = _GetLicenseUserMetadataPtr.asFunction<
      int Function(CSTRTYPE, STRTYPE, int)>();

  int GetLicenseType(
    STRTYPE licenseType,
    int length,
  ) {
    return _GetLicenseType(
      licenseType,
      length,
    );
  }

  late final _GetLicenseTypePtr =
      _lookup<NativeFunction<Int32 Function(STRTYPE, Uint32)>>(
          'GetLicenseType');
  late final _GetLicenseType =
      _GetLicenseTypePtr.asFunction<int Function(STRTYPE, int)>();

  int GetActivationMetadata(
    CSTRTYPE key,
    STRTYPE value,
    int length,
  ) {
    return _GetActivationMetadata(
      key,
      value,
      length,
    );
  }

  late final _GetActivationMetadataPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, STRTYPE, Uint32)>>(
          'GetActivationMetadata');
  late final _GetActivationMetadata = _GetActivationMetadataPtr.asFunction<
      int Function(CSTRTYPE, STRTYPE, int)>();

  int GetActivationMeterAttributeUses(
    CSTRTYPE name,
    Pointer<Uint32> uses,
  ) {
    return _GetActivationMeterAttributeUses(
      name,
      uses,
    );
  }

  late final _GetActivationMeterAttributeUsesPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, Pointer<Uint32>)>>(
          'GetActivationMeterAttributeUses');
  late final _GetActivationMeterAttributeUses =
      _GetActivationMeterAttributeUsesPtr.asFunction<
          int Function(CSTRTYPE, Pointer<Uint32>)>();

  int GetServerSyncGracePeriodExpiryDate(
    Pointer<Uint32> expiryDate,
  ) {
    return _GetServerSyncGracePeriodExpiryDate(
      expiryDate,
    );
  }

  late final _GetServerSyncGracePeriodExpiryDatePtr =
      _lookup<NativeFunction<Int32 Function(Pointer<Uint32>)>>(
          'GetServerSyncGracePeriodExpiryDate');
  late final _GetServerSyncGracePeriodExpiryDate =
      _GetServerSyncGracePeriodExpiryDatePtr.asFunction<
          int Function(Pointer<Uint32>)>();

  int GetTrialActivationMetadata(
    CSTRTYPE key,
    STRTYPE value,
    int length,
  ) {
    return _GetTrialActivationMetadata(
      key,
      value,
      length,
    );
  }

  late final _GetTrialActivationMetadataPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, STRTYPE, Uint32)>>(
          'GetTrialActivationMetadata');
  late final _GetTrialActivationMetadata = _GetTrialActivationMetadataPtr
      .asFunction<int Function(CSTRTYPE, STRTYPE, int)>();

  int GetTrialExpiryDate(
    Pointer<Uint32> trialExpiryDate,
  ) {
    return _GetTrialExpiryDate(
      trialExpiryDate,
    );
  }

  late final _GetTrialExpiryDatePtr =
      _lookup<NativeFunction<Int32 Function(Pointer<Uint32>)>>(
          'GetTrialExpiryDate');
  late final _GetTrialExpiryDate =
      _GetTrialExpiryDatePtr.asFunction<int Function(Pointer<Uint32>)>();

  int GetTrialId(
    STRTYPE trialId,
    int length,
  ) {
    return _GetTrialId(
      trialId,
      length,
    );
  }

  late final _GetTrialIdPtr =
      _lookup<NativeFunction<Int32 Function(STRTYPE, Uint32)>>('GetTrialId');
  late final _GetTrialId =
      _GetTrialIdPtr.asFunction<int Function(STRTYPE, int)>();

  int GetLocalTrialExpiryDate(
    Pointer<Uint32> trialExpiryDate,
  ) {
    return _GetLocalTrialExpiryDate(
      trialExpiryDate,
    );
  }

  late final _GetLocalTrialExpiryDatePtr =
      _lookup<NativeFunction<Int32 Function(Pointer<Uint32>)>>(
          'GetLocalTrialExpiryDate');
  late final _GetLocalTrialExpiryDate =
      _GetLocalTrialExpiryDatePtr.asFunction<int Function(Pointer<Uint32>)>();

  int GetLibraryVersion(
    STRTYPE libraryVersion,
    int length,
  ) {
    return _GetLibraryVersion(
      libraryVersion,
      length,
    );
  }

  late final _GetLibraryVersionPtr =
      _lookup<NativeFunction<Int32 Function(STRTYPE, Uint32)>>(
          'GetLibraryVersion');
  late final _GetLibraryVersion =
      _GetLibraryVersionPtr.asFunction<int Function(STRTYPE, int)>();

  int CheckForReleaseUpdate(
    CSTRTYPE platform,
    CSTRTYPE version,
    CSTRTYPE channel,
    CallbackType releaseUpdateCallback,
  ) {
    return _CheckForReleaseUpdate(
      platform,
      version,
      channel,
      releaseUpdateCallback,
    );
  }

  late final _CheckForReleaseUpdatePtr = _lookup<
      NativeFunction<
          Int32 Function(CSTRTYPE, CSTRTYPE, CSTRTYPE,
              CallbackType)>>('CheckForReleaseUpdate');
  late final _CheckForReleaseUpdate = _CheckForReleaseUpdatePtr.asFunction<
      int Function(CSTRTYPE, CSTRTYPE, CSTRTYPE, CallbackType)>();

  int ActivateLicense() {
    return _ActivateLicense();
  }

  late final _ActivateLicensePtr =
      _lookup<NativeFunction<Int32 Function()>>('ActivateLicense');
  late final _ActivateLicense =
      _ActivateLicensePtr.asFunction<int Function()>();

  int ActivateLicenseOffline(
    CSTRTYPE filePath,
  ) {
    return _ActivateLicenseOffline(
      filePath,
    );
  }

  late final _ActivateLicenseOfflinePtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>(
          'ActivateLicenseOffline');
  late final _ActivateLicenseOffline =
      _ActivateLicenseOfflinePtr.asFunction<int Function(CSTRTYPE)>();

  int GenerateOfflineActivationRequest(
    CSTRTYPE filePath,
  ) {
    return _GenerateOfflineActivationRequest(
      filePath,
    );
  }

  late final _GenerateOfflineActivationRequestPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>(
          'GenerateOfflineActivationRequest');
  late final _GenerateOfflineActivationRequest =
      _GenerateOfflineActivationRequestPtr.asFunction<int Function(CSTRTYPE)>();

  int DeactivateLicense() {
    return _DeactivateLicense();
  }

  late final _DeactivateLicensePtr =
      _lookup<NativeFunction<Int32 Function()>>('DeactivateLicense');
  late final _DeactivateLicense =
      _DeactivateLicensePtr.asFunction<int Function()>();

  int GenerateOfflineDeactivationRequest(
    CSTRTYPE filePath,
  ) {
    return _GenerateOfflineDeactivationRequest(
      filePath,
    );
  }

  late final _GenerateOfflineDeactivationRequestPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>(
          'GenerateOfflineDeactivationRequest');
  late final _GenerateOfflineDeactivationRequest =
      _GenerateOfflineDeactivationRequestPtr.asFunction<
          int Function(CSTRTYPE)>();

  int IsLicenseGenuine() {
    return _IsLicenseGenuine();
  }

  late final _IsLicenseGenuinePtr =
      _lookup<NativeFunction<Int32 Function()>>('IsLicenseGenuine');
  late final _IsLicenseGenuine =
      _IsLicenseGenuinePtr.asFunction<int Function()>();

  int IsLicenseValid() {
    return _IsLicenseValid();
  }

  late final _IsLicenseValidPtr =
      _lookup<NativeFunction<Int32 Function()>>('IsLicenseValid');
  late final _IsLicenseValid = _IsLicenseValidPtr.asFunction<int Function()>();

  int ActivateTrial() {
    return _ActivateTrial();
  }

  late final _ActivateTrialPtr =
      _lookup<NativeFunction<Int32 Function()>>('ActivateTrial');
  late final _ActivateTrial = _ActivateTrialPtr.asFunction<int Function()>();

  int ActivateTrialOffline(
    CSTRTYPE filePath,
  ) {
    return _ActivateTrialOffline(
      filePath,
    );
  }

  late final _ActivateTrialOfflinePtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>('ActivateTrialOffline');
  late final _ActivateTrialOffline =
      _ActivateTrialOfflinePtr.asFunction<int Function(CSTRTYPE)>();

  int GenerateOfflineTrialActivationRequest(
    CSTRTYPE filePath,
  ) {
    return _GenerateOfflineTrialActivationRequest(
      filePath,
    );
  }

  late final _GenerateOfflineTrialActivationRequestPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>(
          'GenerateOfflineTrialActivationRequest');
  late final _GenerateOfflineTrialActivationRequest =
      _GenerateOfflineTrialActivationRequestPtr.asFunction<
          int Function(CSTRTYPE)>();

  int IsTrialGenuine() {
    return _IsTrialGenuine();
  }

  late final _IsTrialGenuinePtr =
      _lookup<NativeFunction<Int32 Function()>>('IsTrialGenuine');
  late final _IsTrialGenuine = _IsTrialGenuinePtr.asFunction<int Function()>();

  int ActivateLocalTrial(
    int trialLength,
  ) {
    return _ActivateLocalTrial(
      trialLength,
    );
  }

  late final _ActivateLocalTrialPtr =
      _lookup<NativeFunction<Int32 Function(Uint32)>>('ActivateLocalTrial');
  late final _ActivateLocalTrial =
      _ActivateLocalTrialPtr.asFunction<int Function(int)>();

  int IsLocalTrialGenuine() {
    return _IsLocalTrialGenuine();
  }

  late final _IsLocalTrialGenuinePtr =
      _lookup<NativeFunction<Int32 Function()>>('IsLocalTrialGenuine');
  late final _IsLocalTrialGenuine =
      _IsLocalTrialGenuinePtr.asFunction<int Function()>();

  int ExtendLocalTrial(
    int trialExtensionLength,
  ) {
    return _ExtendLocalTrial(
      trialExtensionLength,
    );
  }

  late final _ExtendLocalTrialPtr =
      _lookup<NativeFunction<Int32 Function(Uint32)>>('ExtendLocalTrial');
  late final _ExtendLocalTrial =
      _ExtendLocalTrialPtr.asFunction<int Function(int)>();

  int IncrementActivationMeterAttributeUses(
    CSTRTYPE name,
    int increment,
  ) {
    return _IncrementActivationMeterAttributeUses(
      name,
      increment,
    );
  }

  late final _IncrementActivationMeterAttributeUsesPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, Uint32)>>(
          'IncrementActivationMeterAttributeUses');
  late final _IncrementActivationMeterAttributeUses =
      _IncrementActivationMeterAttributeUsesPtr.asFunction<
          int Function(CSTRTYPE, int)>();

  int DecrementActivationMeterAttributeUses(
    CSTRTYPE name,
    int decrement,
  ) {
    return _DecrementActivationMeterAttributeUses(
      name,
      decrement,
    );
  }

  late final _DecrementActivationMeterAttributeUsesPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, Uint32)>>(
          'DecrementActivationMeterAttributeUses');
  late final _DecrementActivationMeterAttributeUses =
      _DecrementActivationMeterAttributeUsesPtr.asFunction<
          int Function(CSTRTYPE, int)>();

  int ResetActivationMeterAttributeUses(
    CSTRTYPE name,
  ) {
    return _ResetActivationMeterAttributeUses(
      name,
    );
  }

  late final _ResetActivationMeterAttributeUsesPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>(
          'ResetActivationMeterAttributeUses');
  late final _ResetActivationMeterAttributeUses =
      _ResetActivationMeterAttributeUsesPtr.asFunction<
          int Function(CSTRTYPE)>();

  int Reset() {
    return _Reset();
  }

  late final _ResetPtr = _lookup<NativeFunction<Int32 Function()>>('Reset');
  late final _Reset = _ResetPtr.asFunction<int Function()>();
}

class max_align_t extends Opaque {}

typedef CSTRTYPE = Pointer<Utf8>;
typedef CallbackType = Pointer<NativeFunction<Void Function(Uint32)>>;
// typedef CallbackTypeDart = Pointer<NativeFunction<Void Function(Uint32)>>;
typedef CallbackFunc = Void Function(Uint32);
typedef CallbackFuncDart = void Function(int);
typedef STRTYPE = Pointer<Utf8>;

const int INT8_MIN = -128;

const int INT16_MIN = -32768;

const int INT32_MIN = -2147483648;

const int INT64_MIN = -9223372036854775808;

const int INT8_MAX = 127;

const int INT16_MAX = 32767;

const int INT32_MAX = 2147483647;

const int INT64_MAX = 9223372036854775807;

const int UINT8_MAX = 255;

const int UINT16_MAX = 65535;

const int UINT32_MAX = 4294967295;

const int UINT64_MAX = -1;

const int INT_LEAST8_MIN = -128;

const int INT_LEAST16_MIN = -32768;

const int INT_LEAST32_MIN = -2147483648;

const int INT_LEAST64_MIN = -9223372036854775808;

const int INT_LEAST8_MAX = 127;

const int INT_LEAST16_MAX = 32767;

const int INT_LEAST32_MAX = 2147483647;

const int INT_LEAST64_MAX = 9223372036854775807;

const int UINT_LEAST8_MAX = 255;

const int UINT_LEAST16_MAX = 65535;

const int UINT_LEAST32_MAX = 4294967295;

const int UINT_LEAST64_MAX = -1;

const int INT_FAST8_MIN = -128;

const int INT_FAST16_MIN = -9223372036854775808;

const int INT_FAST32_MIN = -9223372036854775808;

const int INT_FAST64_MIN = -9223372036854775808;

const int INT_FAST8_MAX = 127;

const int INT_FAST16_MAX = 9223372036854775807;

const int INT_FAST32_MAX = 9223372036854775807;

const int INT_FAST64_MAX = 9223372036854775807;

const int UINT_FAST8_MAX = 255;

const int UINT_FAST16_MAX = -1;

const int UINT_FAST32_MAX = -1;

const int UINT_FAST64_MAX = -1;

const int INTPTR_MIN = -9223372036854775808;

const int INTPTR_MAX = 9223372036854775807;

const int UINTPTR_MAX = -1;

const int INTMAX_MIN = -9223372036854775808;

const int INTMAX_MAX = 9223372036854775807;

const int UINTMAX_MAX = -1;

const int PTRDIFF_MIN = -9223372036854775808;

const int PTRDIFF_MAX = 9223372036854775807;

const int SIG_ATOMIC_MIN = -2147483648;

const int SIG_ATOMIC_MAX = 2147483647;

const int SIZE_MAX = -1;

const int WCHAR_MIN = -2147483648;

const int WCHAR_MAX = 2147483647;

const int WINT_MIN = 0;

const int WINT_MAX = 4294967295;

const int NULL = 0;
