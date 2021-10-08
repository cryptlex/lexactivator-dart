// ignore_for_file: non_constant_identifier_names, camel_case_types, constant_identifier_names
import 'dart:ffi';
import 'dart:io';
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
    String filePath,
  ) {
    if (Platform.isWindows) {
      return _SetProductFileWin(convertDartStringToCSTR(filePath).cast());
    }
    return _SetProductFile(
      convertDartStringToCSTR(filePath).cast(),
    );
  }

  late final _SetProductFilePtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>('SetProductFile');
  late final _SetProductFile =
      _SetProductFilePtr.asFunction<int Function(CSTRTYPE)>();

  late final _SetProductFilePtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>('SetProductFile');
  late final _SetProductFileWin =
      _SetProductFilePtrWin.asFunction<int Function(CSTRTYPE)>();

  int SetProductData(
    String productData,
  ) {
    if (Platform.isWindows) {
      return _SetProductDataWin(
        convertDartStringToCSTR(productData).cast(),
      );
    }

    return _SetProductData(
      convertDartStringToCSTR(productData).cast(),
    );
  }

  late final _SetProductDataPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>('SetProductData');
  late final _SetProductData =
      _SetProductDataPtr.asFunction<int Function(CSTRTYPE)>();

  late final _SetProductDataPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN)>>('SetProductData');
  late final _SetProductDataWin =
      _SetProductDataPtrWin.asFunction<int Function(CSTRTYPE_WIN)>();

  int SetProductId(
    String productId,
    int flags,
  ) {
    if (Platform.isWindows) {
      return _SetProductIdWin(
        convertDartStringToCSTR(productId).cast(),
        flags,
      );
    }
    return _SetProductId(
      convertDartStringToCSTR(productId).cast(),
      flags,
    );
  }

  late final _SetProductIdPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, Uint32)>>('SetProductId');
  late final _SetProductId =
      _SetProductIdPtr.asFunction<int Function(CSTRTYPE, int)>();

  late final _SetProductIdPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN, Uint32)>>(
          'SetProductId');
  late final _SetProductIdWin =
      _SetProductIdPtrWin.asFunction<int Function(CSTRTYPE_WIN, int)>();

  int SetDataDirectory(
    String directoryPath,
  ) {
    if (Platform.isWindows) {
      return _SetDataDirectoryWin(
          convertDartStringToCSTR(directoryPath).cast());
    }
    return _SetDataDirectory(convertDartStringToCSTR(directoryPath).cast());
  }

  late final _SetDataDirectoryPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>('SetDataDirectory');
  late final _SetDataDirectory =
      _SetDataDirectoryPtr.asFunction<int Function(CSTRTYPE)>();

  late final _SetDataDirectoryPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN)>>('SetDataDirectory');
  late final _SetDataDirectoryWin =
      _SetDataDirectoryPtrWin.asFunction<int Function(CSTRTYPE_WIN)>();

  int SetCustomDeviceFingerprint(
    String fingerprint,
  ) {
    if (Platform.isWindows) {
      return _SetCustomDeviceFingerprintWin(
        convertDartStringToCSTR(fingerprint).cast(),
      );
    }
    return _SetCustomDeviceFingerprint(
      convertDartStringToCSTR(fingerprint).cast(),
    );
  }

  late final _SetCustomDeviceFingerprintPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>(
          'SetCustomDeviceFingerprint');
  late final _SetCustomDeviceFingerprint =
      _SetCustomDeviceFingerprintPtr.asFunction<int Function(CSTRTYPE)>();

  late final _SetCustomDeviceFingerprintPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN)>>(
          'SetCustomDeviceFingerprint');
  late final _SetCustomDeviceFingerprintWin = _SetCustomDeviceFingerprintPtrWin
      .asFunction<int Function(CSTRTYPE_WIN)>();

  int SetLicenseKey(
    String licenseKey,
  ) {
    if (Platform.isWindows) {
      return _SetLicenseKeyWin(
        convertDartStringToCSTR(licenseKey).cast(),
      );
    }
    return _SetLicenseKey(
      convertDartStringToCSTR(licenseKey).cast(),
    );
  }

  late final _SetLicenseKeyPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>('SetLicenseKey');
  late final _SetLicenseKey =
      _SetLicenseKeyPtr.asFunction<int Function(CSTRTYPE)>();

  late final _SetLicenseKeyPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN)>>('SetLicenseKey');
  late final _SetLicenseKeyWin =
      _SetLicenseKeyPtrWin.asFunction<int Function(CSTRTYPE_WIN)>();

  int SetLicenseUserCredential(
    String email,
    String password,
  ) {
    if (Platform.isWindows) {
      return _SetLicenseUserCredentialWin(
        convertDartStringToCSTR(email).cast(),
        convertDartStringToCSTR(password).cast(),
      );
    }
    return _SetLicenseUserCredential(
      convertDartStringToCSTR(email).cast(),
      convertDartStringToCSTR(password).cast(),
    );
  }

  late final _SetLicenseUserCredentialPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, CSTRTYPE)>>(
          'SetLicenseUserCredential');
  late final _SetLicenseUserCredential = _SetLicenseUserCredentialPtr
      .asFunction<int Function(CSTRTYPE, CSTRTYPE)>();

  late final _SetLicenseUserCredentialPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN, CSTRTYPE_WIN)>>(
          'SetLicenseUserCredential');
  late final _SetLicenseUserCredentialWin = _SetLicenseUserCredentialPtrWin
      .asFunction<int Function(CSTRTYPE_WIN, CSTRTYPE_WIN)>();

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
    String key,
    String value,
  ) {
    if (Platform.isWindows) {
      return _SetActivationMetadataWin(
        convertDartStringToCSTR(key).cast(),
        convertDartStringToCSTR(value).cast(),
      );
    }
    return _SetActivationMetadata(
      convertDartStringToCSTR(key).cast(),
      convertDartStringToCSTR(value).cast(),
    );
  }

  late final _SetActivationMetadataPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, CSTRTYPE)>>(
          'SetActivationMetadata');
  late final _SetActivationMetadata =
      _SetActivationMetadataPtr.asFunction<int Function(CSTRTYPE, CSTRTYPE)>();

  late final _SetActivationMetadataPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN, CSTRTYPE_WIN)>>(
          'SetActivationMetadata');
  late final _SetActivationMetadataWin = _SetActivationMetadataPtrWin
      .asFunction<int Function(CSTRTYPE_WIN, CSTRTYPE_WIN)>();

  int SetTrialActivationMetadata(
    String key,
    String value,
  ) {
    if (Platform.isWindows) {
      return _SetTrialActivationMetadataWin(
        convertDartStringToCSTR(key).cast(),
        convertDartStringToCSTR(value).cast(),
      );
    }
    return _SetTrialActivationMetadata(
      convertDartStringToCSTR(key).cast(),
      convertDartStringToCSTR(value).cast(),
    );
  }

  late final _SetTrialActivationMetadataPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, CSTRTYPE)>>(
          'SetTrialActivationMetadata');
  late final _SetTrialActivationMetadata = _SetTrialActivationMetadataPtr
      .asFunction<int Function(CSTRTYPE, CSTRTYPE)>();

  late final _SetTrialActivationMetadataPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN, CSTRTYPE_WIN)>>(
          'SetTrialActivationMetadata');
  late final _SetTrialActivationMetadataWin = _SetTrialActivationMetadataPtrWin
      .asFunction<int Function(CSTRTYPE_WIN, CSTRTYPE_WIN)>();

  int SetAppVersion(
    String appVersion,
  ) {
    if (Platform.isWindows) {
      return _SetAppVersionWin(
        convertDartStringToCSTR(appVersion).cast(),
      );
    }
    return _SetAppVersion(
      convertDartStringToCSTR(appVersion).cast(),
    );
  }

  late final _SetAppVersionPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>('SetAppVersion');
  late final _SetAppVersion =
      _SetAppVersionPtr.asFunction<int Function(CSTRTYPE)>();

  late final _SetAppVersionPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN)>>('SetAppVersion');
  late final _SetAppVersionWin =
      _SetAppVersionPtrWin.asFunction<int Function(CSTRTYPE_WIN)>();

  int SetOfflineActivationRequestMeterAttributeUses(
    String name,
    int uses,
  ) {
    if (Platform.isWindows) {
      return _SetOfflineActivationRequestMeterAttributeUsesWin(
        convertDartStringToCSTR(name).cast(),
        uses,
      );
    }
    return _SetOfflineActivationRequestMeterAttributeUses(
      convertDartStringToCSTR(name).cast(),
      uses,
    );
  }

  late final _SetOfflineActivationRequestMeterAttributeUsesPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, Uint32)>>(
          'SetOfflineActivationRequestMeterAttributeUses');
  late final _SetOfflineActivationRequestMeterAttributeUses =
      _SetOfflineActivationRequestMeterAttributeUsesPtr.asFunction<
          int Function(CSTRTYPE, int)>();

  late final _SetOfflineActivationRequestMeterAttributeUsesPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN, Uint32)>>(
          'SetOfflineActivationRequestMeterAttributeUses');
  late final _SetOfflineActivationRequestMeterAttributeUsesWin =
      _SetOfflineActivationRequestMeterAttributeUsesPtrWin.asFunction<
          int Function(CSTRTYPE_WIN, int)>();

  int SetNetworkProxy(
    String proxy,
  ) {
    if (Platform.isWindows) {
      return _SetNetworkProxyWin(
        convertDartStringToCSTR(proxy).cast(),
      );
    }
    return _SetNetworkProxy(
      convertDartStringToCSTR(proxy).cast(),
    );
  }

  late final _SetNetworkProxyPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>('SetNetworkProxy');
  late final _SetNetworkProxy =
      _SetNetworkProxyPtr.asFunction<int Function(CSTRTYPE)>();

  late final _SetNetworkProxyPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN)>>('SetNetworkProxy');
  late final _SetNetworkProxyWin =
      _SetNetworkProxyPtrWin.asFunction<int Function(CSTRTYPE_WIN)>();

  int SetCryptlexHost(
    String host,
  ) {
    if (Platform.isWindows) {
      return _SetCryptlexHostWin(
        convertDartStringToCSTR(host).cast(),
      );
    }
    return _SetCryptlexHost(
      convertDartStringToCSTR(host).cast(),
    );
  }

  late final _SetCryptlexHostPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>('SetCryptlexHost');
  late final _SetCryptlexHost =
      _SetCryptlexHostPtr.asFunction<int Function(CSTRTYPE)>();

  late final _SetCryptlexHostPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN)>>('SetCryptlexHost');
  late final _SetCryptlexHostWin =
      _SetCryptlexHostPtrWin.asFunction<int Function(CSTRTYPE_WIN)>();

  int GetProductMetadata(
    String key,
    CSTRTYPE value,
    int length,
  ) {
    if (Platform.isWindows) {
      return _GetProductMetadataWin(
        convertDartStringToCSTR(key).cast(),
        value.cast(),
        length,
      );
    }
    return _GetProductMetadata(
      convertDartStringToCSTR(key).cast(),
      value.cast(),
      length,
    );
  }

  late final _GetProductMetadataPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, CSTRTYPE, Uint32)>>(
          'GetProductMetadata');
  late final _GetProductMetadata = _GetProductMetadataPtr.asFunction<
      int Function(CSTRTYPE, CSTRTYPE, int)>();

  late final _GetProductMetadataPtrWin = _lookup<
          NativeFunction<Int32 Function(CSTRTYPE_WIN, CSTRTYPE_WIN, Uint32)>>(
      'GetProductMetadata');
  late final _GetProductMetadataWin = _GetProductMetadataPtrWin.asFunction<
      int Function(CSTRTYPE_WIN, CSTRTYPE_WIN, int)>();

  int GetLicenseMetadata(
    String key,
    CSTRTYPE value,
    int length,
  ) {
    if (Platform.isWindows) {
      return _GetLicenseMetadataWin(
        convertDartStringToCSTR(key).cast(),
        (value).cast(),
        length,
      );
    }
    return _GetLicenseMetadata(
      convertDartStringToCSTR(key).cast(),
      (value).cast(),
      length,
    );
  }

  late final _GetLicenseMetadataPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, CSTRTYPE, Uint32)>>(
          'GetLicenseMetadata');
  late final _GetLicenseMetadata = _GetLicenseMetadataPtr.asFunction<
      int Function(CSTRTYPE, CSTRTYPE, int)>();

  late final _GetLicenseMetadataPtrWin = _lookup<
          NativeFunction<Int32 Function(CSTRTYPE_WIN, CSTRTYPE_WIN, Uint32)>>(
      'GetLicenseMetadata');
  late final _GetLicenseMetadataWin = _GetLicenseMetadataPtrWin.asFunction<
      int Function(CSTRTYPE_WIN, CSTRTYPE_WIN, int)>();

  int GetLicenseMeterAttribute(
    String name,
    Pointer<Uint32> allowedUses,
    Pointer<Uint32> totalUses,
    Pointer<Uint32> grossUses,
  ) {
    if (Platform.isWindows) {
      return _GetLicenseMeterAttributeWin(
        convertDartStringToCSTR(name).cast(),
        allowedUses,
        totalUses,
        grossUses,
      );
    }
    return _GetLicenseMeterAttribute(
      convertDartStringToCSTR(name).cast(),
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

  late final _GetLicenseMeterAttributePtrWin = _lookup<
      NativeFunction<
          Int32 Function(CSTRTYPE_WIN, Pointer<Uint32>, Pointer<Uint32>,
              Pointer<Uint32>)>>('GetLicenseMeterAttribute');
  late final _GetLicenseMeterAttributeWin =
      _GetLicenseMeterAttributePtrWin.asFunction<
          int Function(CSTRTYPE_WIN, Pointer<Uint32>, Pointer<Uint32>,
              Pointer<Uint32>)>();

  int GetLicenseKey(
    CSTRTYPE licenseKey,
    int length,
  ) {
    if (Platform.isWindows) {
      return _GetLicenseKeyWin(
        (licenseKey).cast(),
        length,
      );
    }
    return _GetLicenseKey(
      (licenseKey).cast(),
      length,
    );
  }

  late final _GetLicenseKeyPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, Uint32)>>(
          'GetLicenseKey');
  late final _GetLicenseKey =
      _GetLicenseKeyPtr.asFunction<int Function(CSTRTYPE, int)>();

  late final _GetLicenseKeyPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN, Uint32)>>(
          'GetLicenseKey');
  late final _GetLicenseKeyWin =
      _GetLicenseKeyPtrWin.asFunction<int Function(CSTRTYPE_WIN, int)>();

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
    CSTRTYPE email,
    int length,
  ) {
    if (Platform.isWindows) {
      return _GetLicenseUserEmailWin(
        email.cast(),
        length,
      );
    }
    return _GetLicenseUserEmail(
      email,
      length,
    );
  }

  late final _GetLicenseUserEmailPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, Uint32)>>(
          'GetLicenseUserEmail');
  late final _GetLicenseUserEmail =
      _GetLicenseUserEmailPtr.asFunction<int Function(CSTRTYPE, int)>();

  late final _GetLicenseUserEmailPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN, Uint32)>>(
          'GetLicenseUserEmail');
  late final _GetLicenseUserEmailWin =
      _GetLicenseUserEmailPtrWin.asFunction<int Function(CSTRTYPE_WIN, int)>();

  int GetLicenseUserName(
    CSTRTYPE name,
    int length,
  ) {
    if (Platform.isWindows) {
      return _GetLicenseUserNameWin(
        name.cast(),
        length,
      );
    }
    return _GetLicenseUserName(
      name,
      length,
    );
  }

  late final _GetLicenseUserNamePtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, Uint32)>>(
          'GetLicenseUserName');
  late final _GetLicenseUserName =
      _GetLicenseUserNamePtr.asFunction<int Function(CSTRTYPE, int)>();

  late final _GetLicenseUserNamePtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN, Uint32)>>(
          'GetLicenseUserName');
  late final _GetLicenseUserNameWin =
      _GetLicenseUserNamePtrWin.asFunction<int Function(CSTRTYPE_WIN, int)>();

  int GetLicenseUserCompany(
    CSTRTYPE company,
    int length,
  ) {
    if (Platform.isWindows) {
      return _GetLicenseUserCompanyWin(
        company.cast(),
        length,
      );
    }
    return _GetLicenseUserCompany(
      company,
      length,
    );
  }

  late final _GetLicenseUserCompanyPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, Uint32)>>(
          'GetLicenseUserCompany');
  late final _GetLicenseUserCompany =
      _GetLicenseUserCompanyPtr.asFunction<int Function(CSTRTYPE, int)>();

  late final _GetLicenseUserCompanyPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN, Uint32)>>(
          'GetLicenseUserCompany');
  late final _GetLicenseUserCompanyWin = _GetLicenseUserCompanyPtrWin
      .asFunction<int Function(CSTRTYPE_WIN, int)>();

  int GetLicenseUserMetadata(
    String key,
    CSTRTYPE value,
    int length,
  ) {
    if (Platform.isWindows) {
      return _GetLicenseUserMetadataWin(
        convertDartStringToCSTR(key).cast(),
        value.cast(),
        length,
      );
    }
    return _GetLicenseUserMetadata(
      convertDartStringToCSTR(key).cast(),
      value,
      length,
    );
  }

  late final _GetLicenseUserMetadataPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, CSTRTYPE, Uint32)>>(
          'GetLicenseUserMetadata');
  late final _GetLicenseUserMetadata = _GetLicenseUserMetadataPtr.asFunction<
      int Function(CSTRTYPE, CSTRTYPE, int)>();

  late final _GetLicenseUserMetadataPtrWin = _lookup<
          NativeFunction<Int32 Function(CSTRTYPE_WIN, CSTRTYPE_WIN, Uint32)>>(
      'GetLicenseUserMetadata');
  late final _GetLicenseUserMetadataWin = _GetLicenseUserMetadataPtrWin
      .asFunction<int Function(CSTRTYPE_WIN, CSTRTYPE_WIN, int)>();

  int GetLicenseType(
    CSTRTYPE licenseType,
    int length,
  ) {
    if (Platform.isWindows) {
      return _GetLicenseTypeWin(
        licenseType.cast(),
        length,
      );
    }
    return _GetLicenseType(
      licenseType,
      length,
    );
  }

  late final _GetLicenseTypePtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, Uint32)>>(
          'GetLicenseType');
  late final _GetLicenseType =
      _GetLicenseTypePtr.asFunction<int Function(CSTRTYPE, int)>();

  late final _GetLicenseTypePtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN, Uint32)>>(
          'GetLicenseType');
  late final _GetLicenseTypeWin =
      _GetLicenseTypePtrWin.asFunction<int Function(CSTRTYPE_WIN, int)>();

  int GetActivationMetadata(
    String key,
    CSTRTYPE value,
    int length,
  ) {
    if (Platform.isWindows) {
      return _GetActivationMetadataWin(
        convertDartStringToCSTR(key).cast(),
        value.cast(),
        length,
      );
    }
    return _GetActivationMetadata(
      convertDartStringToCSTR(key).cast(),
      value,
      length,
    );
  }

  late final _GetActivationMetadataPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, CSTRTYPE, Uint32)>>(
          'GetActivationMetadata');
  late final _GetActivationMetadata = _GetActivationMetadataPtr.asFunction<
      int Function(CSTRTYPE, CSTRTYPE, int)>();

  late final _GetActivationMetadataPtrWin = _lookup<
          NativeFunction<Int32 Function(CSTRTYPE_WIN, CSTRTYPE_WIN, Uint32)>>(
      'GetActivationMetadata');
  late final _GetActivationMetadataWin = _GetActivationMetadataPtrWin
      .asFunction<int Function(CSTRTYPE_WIN, CSTRTYPE_WIN, int)>();

  int GetActivationMeterAttributeUses(
    String name,
    Pointer<Uint32> uses,
  ) {
    return _GetActivationMeterAttributeUses(
      convertDartStringToCSTR(name).cast(),
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
    String key,
    CSTRTYPE value,
    int length,
  ) {
    if (Platform.isWindows) {
      return _GetTrialActivationMetadataWin(
        convertDartStringToCSTR(key).cast(),
        value.cast(),
        length,
      );
    }
    return _GetTrialActivationMetadata(
      convertDartStringToCSTR(key).cast(),
      value,
      length,
    );
  }

  late final _GetTrialActivationMetadataPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, CSTRTYPE, Uint32)>>(
          'GetTrialActivationMetadata');
  late final _GetTrialActivationMetadata = _GetTrialActivationMetadataPtr
      .asFunction<int Function(CSTRTYPE, CSTRTYPE, int)>();

  late final _GetTrialActivationMetadataPtrWin = _lookup<
          NativeFunction<Int32 Function(CSTRTYPE_WIN, CSTRTYPE_WIN, Uint32)>>(
      'GetTrialActivationMetadata');
  late final _GetTrialActivationMetadataWin = _GetTrialActivationMetadataPtrWin
      .asFunction<int Function(CSTRTYPE_WIN, CSTRTYPE_WIN, int)>();

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
    CSTRTYPE trialId,
    int length,
  ) {
    if (Platform.isWindows) {
      return _GetTrialIdWin(
        trialId.cast(),
        length,
      );
    }
    return _GetTrialId(
      trialId,
      length,
    );
  }

  late final _GetTrialIdPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, Uint32)>>('GetTrialId');
  late final _GetTrialId =
      _GetTrialIdPtr.asFunction<int Function(CSTRTYPE, int)>();

  late final _GetTrialIdPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN, Uint32)>>(
          'GetTrialId');
  late final _GetTrialIdWin =
      _GetTrialIdPtrWin.asFunction<int Function(CSTRTYPE_WIN, int)>();

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
    CSTRTYPE libraryVersion,
    int length,
  ) {
    if (Platform.isWindows) {
      return _GetLibraryVersionWin(
        libraryVersion.cast(),
        length,
      );
    }

    return _GetLibraryVersion(
      libraryVersion,
      length,
    );
  }

  late final _GetLibraryVersionPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, Uint32)>>(
          'GetLibraryVersion');
  late final _GetLibraryVersion =
      _GetLibraryVersionPtr.asFunction<int Function(CSTRTYPE, int)>();

  late final _GetLibraryVersionPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN, Uint32)>>(
          'GetLibraryVersion');
  late final _GetLibraryVersionWin =
      _GetLibraryVersionPtrWin.asFunction<int Function(CSTRTYPE_WIN, int)>();

  //TODO
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
    String filePath,
  ) {
    if (Platform.isWindows) {
      return _ActivateLicenseOfflineWin(
        convertDartStringToCSTR(filePath).cast(),
      );
    }
    return _ActivateLicenseOffline(
      convertDartStringToCSTR(filePath).cast(),
    );
  }

  late final _ActivateLicenseOfflinePtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>(
          'ActivateLicenseOffline');
  late final _ActivateLicenseOffline =
      _ActivateLicenseOfflinePtr.asFunction<int Function(CSTRTYPE)>();

  late final _ActivateLicenseOfflinePtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN)>>(
          'ActivateLicenseOffline');
  late final _ActivateLicenseOfflineWin =
      _ActivateLicenseOfflinePtrWin.asFunction<int Function(CSTRTYPE_WIN)>();

  int GenerateOfflineActivationRequest(
    String filePath,
  ) {
    if (Platform.isWindows) {
      return _GenerateOfflineActivationRequestWin(
        convertDartStringToCSTR(filePath).cast(),
      );
    }
    return _GenerateOfflineActivationRequest(
      convertDartStringToCSTR(filePath).cast(),
    );
  }

  late final _GenerateOfflineActivationRequestPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>(
          'GenerateOfflineActivationRequest');
  late final _GenerateOfflineActivationRequest =
      _GenerateOfflineActivationRequestPtr.asFunction<int Function(CSTRTYPE)>();

  late final _GenerateOfflineActivationRequestPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN)>>(
          'GenerateOfflineActivationRequest');
  late final _GenerateOfflineActivationRequestWin =
      _GenerateOfflineActivationRequestPtrWin.asFunction<
          int Function(CSTRTYPE_WIN)>();

  int DeactivateLicense() {
    return _DeactivateLicense();
  }

  late final _DeactivateLicensePtr =
      _lookup<NativeFunction<Int32 Function()>>('DeactivateLicense');
  late final _DeactivateLicense =
      _DeactivateLicensePtr.asFunction<int Function()>();

  int GenerateOfflineDeactivationRequest(
    String filePath,
  ) {
    if (Platform.isWindows) {
      return _GenerateOfflineDeactivationRequestWin(
        convertDartStringToCSTR(filePath).cast(),
      );
    }
    return _GenerateOfflineDeactivationRequest(
      convertDartStringToCSTR(filePath).cast(),
    );
  }

  late final _GenerateOfflineDeactivationRequestPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>(
          'GenerateOfflineDeactivationRequest');
  late final _GenerateOfflineDeactivationRequest =
      _GenerateOfflineDeactivationRequestPtr.asFunction<
          int Function(CSTRTYPE)>();

  late final _GenerateOfflineDeactivationRequestPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN)>>(
          'GenerateOfflineDeactivationRequest');
  late final _GenerateOfflineDeactivationRequestWin =
      _GenerateOfflineDeactivationRequestPtrWin.asFunction<
          int Function(CSTRTYPE_WIN)>();

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
    String filePath,
  ) {
    if (Platform.isWindows) {
      return _ActivateTrialOfflineWin(
        convertDartStringToCSTR(filePath).cast(),
      );
    }
    return _ActivateTrialOffline(
      convertDartStringToCSTR(filePath).cast(),
    );
  }

  late final _ActivateTrialOfflinePtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>('ActivateTrialOffline');
  late final _ActivateTrialOffline =
      _ActivateTrialOfflinePtr.asFunction<int Function(CSTRTYPE)>();

  late final _ActivateTrialOfflinePtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN)>>(
          'ActivateTrialOffline');
  late final _ActivateTrialOfflineWin =
      _ActivateTrialOfflinePtrWin.asFunction<int Function(CSTRTYPE_WIN)>();

  int GenerateOfflineTrialActivationRequest(
    String filePath,
  ) {
    if (Platform.isWindows) {
      return _GenerateOfflineTrialActivationRequestWin(
        convertDartStringToCSTR(filePath).cast(),
      );
    }
    return _GenerateOfflineTrialActivationRequest(
      convertDartStringToCSTR(filePath).cast(),
    );
  }

  late final _GenerateOfflineTrialActivationRequestPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>(
          'GenerateOfflineTrialActivationRequest');
  late final _GenerateOfflineTrialActivationRequest =
      _GenerateOfflineTrialActivationRequestPtr.asFunction<
          int Function(CSTRTYPE)>();

  late final _GenerateOfflineTrialActivationRequestPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN)>>(
          'GenerateOfflineTrialActivationRequest');
  late final _GenerateOfflineTrialActivationRequestWin =
      _GenerateOfflineTrialActivationRequestPtrWin.asFunction<
          int Function(CSTRTYPE_WIN)>();

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
    String name,
    int increment,
  ) {
    if (Platform.isWindows) {
      return _IncrementActivationMeterAttributeUsesWin(
        convertDartStringToCSTR(name).cast(),
        increment,
      );
    }
    return _IncrementActivationMeterAttributeUses(
      convertDartStringToCSTR(name).cast(),
      increment,
    );
  }

  late final _IncrementActivationMeterAttributeUsesPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, Uint32)>>(
          'IncrementActivationMeterAttributeUses');
  late final _IncrementActivationMeterAttributeUses =
      _IncrementActivationMeterAttributeUsesPtr.asFunction<
          int Function(CSTRTYPE, int)>();

  late final _IncrementActivationMeterAttributeUsesPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN, Uint32)>>(
          'IncrementActivationMeterAttributeUses');
  late final _IncrementActivationMeterAttributeUsesWin =
      _IncrementActivationMeterAttributeUsesPtrWin.asFunction<
          int Function(CSTRTYPE_WIN, int)>();

  int DecrementActivationMeterAttributeUses(
    String name,
    int decrement,
  ) {
    if (Platform.isWindows) {
      return _DecrementActivationMeterAttributeUsesWin(
        convertDartStringToCSTR(name).cast(),
        decrement,
      );
    }
    return _DecrementActivationMeterAttributeUses(
      convertDartStringToCSTR(name).cast(),
      decrement,
    );
  }

  late final _DecrementActivationMeterAttributeUsesPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, Uint32)>>(
          'DecrementActivationMeterAttributeUses');
  late final _DecrementActivationMeterAttributeUses =
      _DecrementActivationMeterAttributeUsesPtr.asFunction<
          int Function(CSTRTYPE, int)>();

  late final _DecrementActivationMeterAttributeUsesPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN, Uint32)>>(
          'DecrementActivationMeterAttributeUses');
  late final _DecrementActivationMeterAttributeUsesWin =
      _DecrementActivationMeterAttributeUsesPtrWin.asFunction<
          int Function(CSTRTYPE_WIN, int)>();

  int ResetActivationMeterAttributeUses(
    String name,
  ) {
    if (Platform.isWindows) {
      return _ResetActivationMeterAttributeUsesWin(
        convertDartStringToCSTR(name).cast(),
      );
    }
    return _ResetActivationMeterAttributeUses(
      convertDartStringToCSTR(name).cast(),
    );
  }

  late final _ResetActivationMeterAttributeUsesPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>(
          'ResetActivationMeterAttributeUses');
  late final _ResetActivationMeterAttributeUses =
      _ResetActivationMeterAttributeUsesPtr.asFunction<
          int Function(CSTRTYPE)>();

  late final _ResetActivationMeterAttributeUsesPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN)>>(
          'ResetActivationMeterAttributeUses');
  late final _ResetActivationMeterAttributeUsesWin =
      _ResetActivationMeterAttributeUsesPtrWin.asFunction<
          int Function(CSTRTYPE_WIN)>();

  int Reset() {
    return _Reset();
  }

  late final _ResetPtr = _lookup<NativeFunction<Int32 Function()>>('Reset');
  late final _Reset = _ResetPtr.asFunction<int Function()>();

  String convertArrayToDartString(Pointer charPtr) {
    if (Platform.isWindows) {
      return charPtr.cast<Utf16>().toDartString();
    }
    return charPtr.cast<Utf8>().toDartString();
  }

  Pointer convertDartStringToCSTR(String str) {
    if (Platform.isWindows) {
      return str.toNativeUtf16();
    }
    return str.toNativeUtf8();
  }
}

class max_align_t extends Opaque {}

typedef CSTRTYPE = Pointer<Utf8>;

typedef CSTRTYPE_WIN = Pointer<Utf16>;

typedef CallbackType = Pointer<NativeFunction<Void Function(Uint32)>>;
typedef CallbackFunc = Void Function(Uint32);
typedef CallbackFuncDart = void Function(int);

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
