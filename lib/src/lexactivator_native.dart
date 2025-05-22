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
    late final int result;
    if (Platform.isWindows) {
      final string = filePath.toNativeUtf16();
      result = _SetProductFileWin(string);
      calloc.free(string);
      return result;
    }
    final string = filePath.toNativeUtf8();
    result = _SetProductFile(string);
    calloc.free(string);
    return result;
  }

  late final _SetProductFilePtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>('SetProductFile');
  late final _SetProductFile =
      _SetProductFilePtr.asFunction<int Function(CSTRTYPE)>();

  late final _SetProductFilePtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN)>>('SetProductFile');
  late final _SetProductFileWin =
      _SetProductFilePtrWin.asFunction<int Function(CSTRTYPE_WIN)>();

  int SetProductData(
    String productData,
  ) {
    late final int result;
    if (Platform.isWindows) {
      final string = productData.toNativeUtf16();
      result = _SetProductDataWin(string);
      calloc.free(string);
      return result;
    }
    final string = productData.toNativeUtf8();
    result = _SetProductData(string);
    calloc.free(string);
    return result;
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
    late final int result;
    if (Platform.isWindows) {
      final string = productId.toNativeUtf16();
      result = _SetProductIdWin(string, flags);
      calloc.free(string);
      return result;
    }
    final string = productId.toNativeUtf8();
    result = _SetProductId(string, flags);
    calloc.free(string);
    return result;
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
    late final int result;
    if (Platform.isWindows) {
      final string = directoryPath.toNativeUtf16();
      result = _SetDataDirectoryWin(string);
      calloc.free(string);
      return result;
    }
    final string = directoryPath.toNativeUtf8();
    result = _SetDataDirectory(string);
    calloc.free(string);
    return result;
  }

  late final _SetDataDirectoryPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>('SetDataDirectory');
  late final _SetDataDirectory =
      _SetDataDirectoryPtr.asFunction<int Function(CSTRTYPE)>();

  late final _SetDataDirectoryPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN)>>('SetDataDirectory');
  late final _SetDataDirectoryWin =
      _SetDataDirectoryPtrWin.asFunction<int Function(CSTRTYPE_WIN)>();

  int SetDebugMode(
    int flag,
  ) {
    return _SetDebugMode(flag);
  }

  late final _SetDebugModePtr =
      _lookup<NativeFunction<Int32 Function(Uint32)>>('SetDebugMode');
  late final _SetDebugMode = _SetDebugModePtr.asFunction<int Function(int)>();

  int SetCacheMode(
    int enable,
  ) {
    return _SetCacheMode(enable);
  }

  late final _SetCacheModePtr =
      _lookup<NativeFunction<Int32 Function(Uint32)>>('SetCacheMode');
  late final _SetCacheMode = _SetCacheModePtr.asFunction<int Function(int)>();

  int SetCustomDeviceFingerprint(
    String fingerprint,
  ) {
    late final int result;
    if (Platform.isWindows) {
      final string = fingerprint.toNativeUtf16();
      result = _SetCustomDeviceFingerprintWin(string);
      calloc.free(string);
      return result;
    }
    final string = fingerprint.toNativeUtf8();
    result = _SetCustomDeviceFingerprint(string);
    calloc.free(string);
    return result;
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
    late final int result;
    if (Platform.isWindows) {
      final string = licenseKey.toNativeUtf16();
      result = _SetLicenseKeyWin(string);
      calloc.free(string);
      return result;
    }
    final string = licenseKey.toNativeUtf8();
    result = _SetLicenseKey(string);
    calloc.free(string);
    return result;
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
    late final int result;
    if (Platform.isWindows) {
      final stringOne = email.toNativeUtf16();
      final stringTwo = password.toNativeUtf16();
      result = _SetLicenseUserCredentialWin(stringOne, stringTwo);
      calloc.free(stringOne);
      calloc.free(stringTwo);
      return result;
    }
    final stringOne = email.toNativeUtf8();
    final stringTwo = password.toNativeUtf8();
    result = _SetLicenseUserCredential(stringOne, stringTwo);
    calloc.free(stringOne);
    calloc.free(stringTwo);
    return result;
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
    LicenseCallbackType callback,
  ) {
    return _SetLicenseCallback(
      callback,
    );
  }

  late final _SetLicenseCallbackPtr =
      _lookup<NativeFunction<Int32 Function(LicenseCallbackType)>>(
          'SetLicenseCallback');
  late final _SetLicenseCallback =
      _SetLicenseCallbackPtr.asFunction<int Function(LicenseCallbackType)>();

  int SetActivationMetadata(
    String key,
    String value,
  ) {
    late final int result;
    if (Platform.isWindows) {
      final stringOne = key.toNativeUtf16();
      final stringTwo = value.toNativeUtf16();
      result = _SetActivationMetadataWin(stringOne, stringTwo);
      calloc.free(stringOne);
      calloc.free(stringTwo);
      return result;
    }
    final stringOne = key.toNativeUtf8();
    final stringTwo = value.toNativeUtf8();
    result = _SetActivationMetadata(stringOne, stringTwo);
    calloc.free(stringOne);
    calloc.free(stringTwo);
    return result;
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
    late final int result;
    if (Platform.isWindows) {
      final stringOne = key.toNativeUtf16();
      final stringTwo = value.toNativeUtf16();
      result = _SetTrialActivationMetadataWin(stringOne, stringTwo);
      calloc.free(stringOne);
      calloc.free(stringTwo);
      return result;
    }
    final stringOne = key.toNativeUtf8();
    final stringTwo = value.toNativeUtf8();
    result = _SetTrialActivationMetadata(stringOne, stringTwo);
    calloc.free(stringOne);
    calloc.free(stringTwo);
    return result;
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
    late final int result;
    if (Platform.isWindows) {
      final string = appVersion.toNativeUtf16();
      result = _SetAppVersionWin(string);
      calloc.free(string);
      return result;
    }
    final string = appVersion.toNativeUtf8();
    result = _SetAppVersion(string);
    calloc.free(string);
    return result;
  }

  late final _SetAppVersionPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>('SetAppVersion');
  late final _SetAppVersion =
      _SetAppVersionPtr.asFunction<int Function(CSTRTYPE)>();

  late final _SetAppVersionPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN)>>('SetAppVersion');
  late final _SetAppVersionWin =
      _SetAppVersionPtrWin.asFunction<int Function(CSTRTYPE_WIN)>();

  int SetReleasePublishedDate(
    int releasePublishedDate,
  ) {
    return _SetReleasePublishedDate(releasePublishedDate);
  }

  late final _SetReleasePublishedDatePtr =
      _lookup<NativeFunction<Int32 Function(Uint32)>>(
          'SetReleasePublishedDate');
  late final _SetReleasePublishedDate =
      _SetReleasePublishedDatePtr.asFunction<int Function(int)>();

  int SetReleaseChannel(
    String releaseChannel,
  ) {
    late final int result;
    if (Platform.isWindows) {
      final string = releaseChannel.toNativeUtf16();
      result = _SetReleaseChannelWin(string);
      calloc.free(string);
      return result;
    }
    final string = releaseChannel.toNativeUtf8();
    result = _SetReleaseChannel(string);
    calloc.free(string);
    return result;
  }

  late final _SetReleaseChannelPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>('SetReleaseChannel');
  late final _SetReleaseChannel =
      _SetReleaseChannelPtr.asFunction<int Function(CSTRTYPE)>();

  late final _SetReleaseChannelPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN)>>(
          'SetReleaseChannel');
  late final _SetReleaseChannelWin =
      _SetReleaseChannelPtrWin.asFunction<int Function(CSTRTYPE_WIN)>();

  int SetReleasePlatform(
    String releasePlatform,
  ) {
    late final int result;
    if (Platform.isWindows) {
      final string = releasePlatform.toNativeUtf16();
      result = _SetReleasePlatformWin(string);
      calloc.free(string);
      return result;
    }
    final string = releasePlatform.toNativeUtf8();
    result = _SetReleasePlatform(string);
    calloc.free(string);
    return result;
  }

  late final _SetReleasePlatformPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>('SetReleasePlatform');
  late final _SetReleasePlatform =
      _SetReleasePlatformPtr.asFunction<int Function(CSTRTYPE)>();

  late final _SetReleasePlatformPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN)>>(
          'SetReleasePlatform');
  late final _SetReleasePlatformWin =
      _SetReleasePlatformPtrWin.asFunction<int Function(CSTRTYPE_WIN)>();

  int SetOfflineActivationRequestMeterAttributeUses(
    String name,
    int uses,
  ) {
    late final int result;
    if (Platform.isWindows) {
      final string = name.toNativeUtf16();
      result = _SetOfflineActivationRequestMeterAttributeUsesWin(
        string,
        uses,
      );
      calloc.free(string);
      return result;
    }
    final string = name.toNativeUtf8();
    result = _SetOfflineActivationRequestMeterAttributeUses(
      string,
      uses,
    );
    calloc.free(string);
    return result;
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
    late final int result;
    if (Platform.isWindows) {
      final string = proxy.toNativeUtf16();
      result = _SetNetworkProxyWin(string);
      calloc.free(string);
      return result;
    }
    final string = proxy.toNativeUtf8();
    result = _SetNetworkProxy(string);
    calloc.free(string);
    return result;
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
    late final int result;
    if (Platform.isWindows) {
      final string = host.toNativeUtf16();
      result = _SetCryptlexHostWin(string);
      calloc.free(string);
      return result;
    }
    final string = host.toNativeUtf8();
    result = _SetCryptlexHost(string);
    calloc.free(string);
    return result;
  }

  late final _SetCryptlexHostPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>('SetCryptlexHost');
  late final _SetCryptlexHost =
      _SetCryptlexHostPtr.asFunction<int Function(CSTRTYPE)>();

  late final _SetCryptlexHostPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN)>>('SetCryptlexHost');
  late final _SetCryptlexHostWin =
      _SetCryptlexHostPtrWin.asFunction<int Function(CSTRTYPE_WIN)>();

  int SetActivationLeaseDuration(
    int leaseDuration,
  ) {
    return _SetActivationLeaseDuration(leaseDuration);
  }

  late final _SetActivationLeaseDurationPtr =
      _lookup<NativeFunction<Int32 Function(Int32)>>(
          'SetActivationLeaseDuration');
  late final _SetActivationLeaseDuration =
      _SetActivationLeaseDurationPtr.asFunction<int Function(int)>();

  int SetTwoFactorAuthenticationCode(
    String twoFactorAuthenticationCode,
  ) {
    late final int result;
    if (Platform.isWindows) {
      final string = twoFactorAuthenticationCode.toNativeUtf16();
      result = _SetTwoFactorAuthenticationCodeWin(string);
      calloc.free(string);
      return result;
    }
    final string = twoFactorAuthenticationCode.toNativeUtf8();
    result = _SetTwoFactorAuthenticationCode(string);
    calloc.free(string);
    return result;
  }

  late final _SetTwoFactorAuthenticationCodePtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>(
          'SetTwoFactorAuthenticationCode');
  late final _SetTwoFactorAuthenticationCode =
      _SetTwoFactorAuthenticationCodePtr.asFunction<int Function(CSTRTYPE)>();
  late final _SetTwoFactorAuthenticationCodePtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN)>>(
          'SetTwoFactorAuthenticationCode');
  late final _SetTwoFactorAuthenticationCodeWin =
      _SetTwoFactorAuthenticationCodePtrWin.asFunction<
          int Function(CSTRTYPE_WIN)>();
  int GetProductMetadata(
    String key,
    CSTRTYPE value,
    int length,
  ) {
    late final int result;
    if (Platform.isWindows) {
      final string = key.toNativeUtf16();
      result = _GetProductMetadataWin(
        string,
        value.cast(),
        length,
      );
      calloc.free(string);
      return result;
    }
    final string = key.toNativeUtf8();
    result = _GetProductMetadata(
      string,
      value.cast(),
      length,
    );
    calloc.free(string);
    return result;
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

  int GetProductVersionName(CSTRTYPE name, int length) {
    if (Platform.isWindows) {
      return _GetProductVersionNameWin(
        name.cast(),
        length,
      );
    }
    return _GetProductVersionName(
      name,
      length,
    );
  }

  late final _GetProductVersionNamePtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, Uint32)>>(
          'GetProductVersionName');
  late final _GetProductVersionName =
      _GetProductVersionNamePtr.asFunction<int Function(CSTRTYPE, int)>();

  late final _GetProductVersionNamePtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN, Uint32)>>(
          'GetProductVersionName');
  late final _GetProductVersionNameWin = _GetProductVersionNamePtrWin
      .asFunction<int Function(CSTRTYPE_WIN, int)>();

  int GetProductVersionDisplayName(CSTRTYPE name, int length) {
    if (Platform.isWindows) {
      return _GetProductVersionDisplayNameWin(
        name.cast(),
        length,
      );
    }
    return _GetProductVersionDisplayName(
      name,
      length,
    );
  }

  late final _GetProductVersionDisplayNamePtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, Uint32)>>(
          'GetProductVersionDisplayName');
  late final _GetProductVersionDisplayName = _GetProductVersionDisplayNamePtr
      .asFunction<int Function(CSTRTYPE, int)>();

  late final _GetProductVersionDisplayNamePtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN, Uint32)>>(
          'GetProductVersionDisplayName');
  late final _GetProductVersionDisplayNameWin =
      _GetProductVersionDisplayNamePtrWin.asFunction<
          int Function(CSTRTYPE_WIN, int)>();

  int GetProductVersionFeatureFlag(
      String name, Pointer<Uint32> enabled, CSTRTYPE data, int length) {
    late final int result;
    if (Platform.isWindows) {
      final string = name.toNativeUtf16();
      result = _GetProductVersionFeatureFlagWin(
        string,
        enabled,
        data.cast(),
        length,
      );
      calloc.free(string);
      return result;
    }
    final string = name.toNativeUtf8();
    result = _GetProductVersionFeatureFlag(
      string,
      enabled,
      data,
      length,
    );
    calloc.free(string);
    return result;
  }

  late final _GetProductVersionFeatureFlagPtr = _lookup<
      NativeFunction<
          Int32 Function(CSTRTYPE, Pointer<Uint32>, CSTRTYPE,
              Uint32)>>('GetProductVersionFeatureFlag');
  late final _GetProductVersionFeatureFlag = _GetProductVersionFeatureFlagPtr
      .asFunction<int Function(CSTRTYPE, Pointer<Uint32>, CSTRTYPE, int)>();

  late final _GetProductVersionFeatureFlagPtrWin = _lookup<
      NativeFunction<
          Int32 Function(CSTRTYPE_WIN, Pointer<Uint32>, CSTRTYPE_WIN,
              Uint32)>>('GetProductVersionFeatureFlag');
  late final _GetProductVersionFeatureFlagWin =
      _GetProductVersionFeatureFlagPtrWin.asFunction<
          int Function(CSTRTYPE_WIN, Pointer<Uint32>, CSTRTYPE_WIN, int)>();

  int GetLicenseMetadata(
    String key,
    CSTRTYPE value,
    int length,
  ) {
    late final int result;
    if (Platform.isWindows) {
      final string = key.toNativeUtf16();
      result = _GetLicenseMetadataWin(
        string,
        value.cast(),
        length,
      );
      calloc.free(string);
      return result;
    }
    final string = key.toNativeUtf8();
    result = _GetLicenseMetadata(
      string,
      value.cast(),
      length,
    );
    calloc.free(string);
    return result;
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
    Pointer<Int64> allowedUses,
    Pointer<Uint64> totalUses,
    Pointer<Uint64> grossUses,
  ) {
    late final int result;
    if (Platform.isWindows) {
      final string = (name).toNativeUtf16();
      result = _GetLicenseMeterAttributeWin(
        string,
        allowedUses,
        totalUses,
        grossUses,
      );
      calloc.free(string);
      return result;
    }
    final string = (name).toNativeUtf8();
    result = _GetLicenseMeterAttribute(
      string,
      allowedUses,
      totalUses,
      grossUses,
    );
    calloc.free(string);
    return result;
  }

  late final _GetLicenseMeterAttributePtr = _lookup<
      NativeFunction<
          Int32 Function(CSTRTYPE, Pointer<Int64>, Pointer<Uint64>,
              Pointer<Uint64>)>>('GetLicenseMeterAttribute');
  late final _GetLicenseMeterAttribute =
      _GetLicenseMeterAttributePtr.asFunction<
          int Function(
              CSTRTYPE, Pointer<Int64>, Pointer<Uint64>, Pointer<Uint64>)>();

  late final _GetLicenseMeterAttributePtrWin = _lookup<
      NativeFunction<
          Int32 Function(CSTRTYPE_WIN, Pointer<Int64>, Pointer<Uint64>,
              Pointer<Uint64>)>>('GetLicenseMeterAttribute');
  late final _GetLicenseMeterAttributeWin =
      _GetLicenseMeterAttributePtrWin.asFunction<
          int Function(CSTRTYPE_WIN, Pointer<Int64>, Pointer<Uint64>,
              Pointer<Uint64>)>();

  int GetLicenseKey(
    CSTRTYPE licenseKey,
    int length,
  ) {
    late final int result;
    if (Platform.isWindows) {
      result = _GetLicenseKeyWin(
        (licenseKey).cast(),
        length,
      );
      return result;
    }
    result = _GetLicenseKey(
      (licenseKey).cast(),
      length,
    );
    return result;
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
    Pointer<Int64> allowedActivations,
  ) {
    return _GetLicenseAllowedActivations(
      allowedActivations,
    );
  }

  late final _GetLicenseAllowedActivationsPtr =
      _lookup<NativeFunction<Int32 Function(Pointer<Int64>)>>(
          'GetLicenseAllowedActivations');
  late final _GetLicenseAllowedActivations = _GetLicenseAllowedActivationsPtr
      .asFunction<int Function(Pointer<Int64>)>();

  int GetLicenseAllowedDeactivations(
    Pointer<Int64> allowedDeactivations,
  ) {
    return _GetLicenseAllowedDeactivations(allowedDeactivations);
  }

  late final _GetLicenseAllowedDeactivationsPtr =
      _lookup<NativeFunction<Int32 Function(Pointer<Int64>)>>(
          'GetLicenseAllowedDeactivations');
  late final _GetLicenseAllowedDeactivations =
      _GetLicenseAllowedDeactivationsPtr.asFunction<
          int Function(Pointer<Int64>)>();

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

  int GetLicenseTotalDeactivations(
    Pointer<Uint32> totalDeactivations,
  ) {
    return _GetLicenseTotalDeactivations(totalDeactivations);
  }

  late final _GetLicenseTotalDeactivationsPtr =
      _lookup<NativeFunction<Int32 Function(Pointer<Uint32>)>>(
          'GetLicenseTotalDeactivations');
  late final _GetLicenseTotalDeactivations = _GetLicenseTotalDeactivationsPtr
      .asFunction<int Function(Pointer<Uint32>)>();
  int GetLicenseCreationDate(
    Pointer<Uint32> creationDate,
  ) {
    return _GetLicenseCreationDate(creationDate);
  }

  late final _GetLicenseCreationDatePtr =
      _lookup<NativeFunction<Int32 Function(Pointer<Uint32>)>>(
          'GetLicenseCreationDate');
  late final _GetLicenseCreationDate =
      _GetLicenseCreationDatePtr.asFunction<int Function(Pointer<Uint32>)>();
  int GetActivationCreationDate(
    Pointer<Uint32> activationDate,
  ) {
    return _GetActivationCreationDate(activationDate);
  }

  late final _GetActivationCreationDatePtr =
      _lookup<NativeFunction<Int32 Function(Pointer<Uint32>)>>(
          'GetActivationCreationDate');
  late final _GetActivationCreationDate =
      _GetActivationCreationDatePtr.asFunction<int Function(Pointer<Uint32>)>();

  int GetLicenseActivationDate(
    Pointer<Uint32> activationDate,
  ) {
    return _GetLicenseActivationDate(activationDate);
  }

  late final _GetLicenseActivationDatePtr =
      _lookup<NativeFunction<Int32 Function(Pointer<Uint32>)>>(
          'GetLicenseActivationDate');
  late final _GetLicenseActivationDate =
      _GetLicenseActivationDatePtr.asFunction<int Function(Pointer<Uint32>)>();

  int GetActivationLastSyncedDate(
    Pointer<Uint32> lastSyncedDate,
  ) {
    return _GetActivationLastSyncedDate(lastSyncedDate);
  }

  late final _GetActivationLastSyncedDatePtr =
      _lookup<NativeFunction<Int32 Function(Pointer<Uint32>)>>(
          'GetActivationLastSyncedDate');
  late final _GetActivationLastSyncedDate =
      _GetActivationLastSyncedDatePtr.asFunction<
          int Function(Pointer<Uint32>)>();

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

  int GetLicenseMaintenanceExpiryDate(
    Pointer<Uint32> expiryDate,
  ) {
    return _GetLicenseMaintenanceExpiryDate(
      expiryDate,
    );
  }

  late final _GetLicenseMaintenanceExpiryDatePtr =
      _lookup<NativeFunction<Int32 Function(Pointer<Uint32>)>>(
          'GetLicenseMaintenanceExpiryDate');
  late final _GetLicenseMaintenanceExpiryDate =
      _GetLicenseMaintenanceExpiryDatePtr.asFunction<
          int Function(Pointer<Uint32>)>();

  int SetReleaseVersion(
    String releaseVersion,
  ) {
    late final int result;
    if (Platform.isWindows) {
      final string = releaseVersion.toNativeUtf16();
      result = _SetReleaseVersionWin(string);
      calloc.free(string);
      return result;
    }
    final string = releaseVersion.toNativeUtf8();
    result = _SetReleaseVersion(string);
    calloc.free(string);
    return result;
  }

  late final _SetReleaseVersionPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>('SetReleaseVersion');
  late final _SetReleaseVersion =
      _SetReleaseVersionPtr.asFunction<int Function(CSTRTYPE)>();

  late final _SetReleaseVersionPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN)>>(
          'SetReleaseVersion');
  late final _SetReleaseVersionWin =
      _SetReleaseVersionPtrWin.asFunction<int Function(CSTRTYPE_WIN)>();

  int GetLicenseMaxAllowedReleaseVersion(
    CSTRTYPE array,
    int length,
  ) {
    if (Platform.isWindows) {
      return _GetLicenseMaxAllowedReleaseVersionWin(
        array.cast(),
        length,
      );
    }
    return _GetLicenseMaxAllowedReleaseVersion(
      array,
      length,
    );
  }

  late final _GetLicenseMaxAllowedReleaseVersionPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, Uint32)>>(
          'GetLicenseMaxAllowedReleaseVersion');
  late final _GetLicenseMaxAllowedReleaseVersion =
      _GetLicenseMaxAllowedReleaseVersionPtr.asFunction<
          int Function(CSTRTYPE, int)>();

  late final _GetLicenseMaxAllowedReleaseVersionPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN, Uint32)>>(
          'GetLicenseMaxAllowedReleaseVersion');
  late final _GetLicenseMaxAllowedReleaseVersionWin =
      _GetLicenseMaxAllowedReleaseVersionPtrWin.asFunction<
          int Function(CSTRTYPE_WIN, int)>();
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
    late final int result;
    if (Platform.isWindows) {
      final string = (key).toNativeUtf16();
      result = _GetLicenseUserMetadataWin(
        string,
        value.cast(),
        length,
      );
      calloc.free(string);
      return result;
    }
    final string = (key).toNativeUtf8();
    result = _GetLicenseUserMetadata(
      string,
      value.cast(),
      length,
    );
    calloc.free(string);
    return result;
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
  int GetLicenseOrganizationName(
    CSTRTYPE organizationName,
    int length,
  ) {
    if (Platform.isWindows) {
      return _GetLicenseOrganizationNameWin(
        organizationName.cast(),
        length,
      );
    }
    return _GetLicenseOrganizationName(
      organizationName,
      length,
    );
  }

  late final _GetLicenseOrganizationNamePtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, Uint32)>>(
          'GetLicenseOrganizationName');
  late final _GetLicenseOrganizationName =
      _GetLicenseOrganizationNamePtr.asFunction<int Function(CSTRTYPE, int)>();
  late final _GetLicenseOrganizationNamePtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN, Uint32)>>(
          'GetLicenseOrganizationName');
  late final _GetLicenseOrganizationNameWin = _GetLicenseOrganizationNamePtrWin
      .asFunction<int Function(CSTRTYPE_WIN, int)>();

  int GetLicenseOrganizationAddress(
    CSTRTYPE organizationAddress,
    int length,
  ) {
    if (Platform.isWindows) {
      return _GetLicenseOrganizationAddressWin(
        organizationAddress.cast(),
        length,
      );
    }
    return _GetLicenseOrganizationAddress(
      organizationAddress,
      length,
    );
  }

  late final _GetLicenseOrganizationAddressPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN, Uint32)>>(
          'GetLicenseOrganizationAddressInternal');
  late final _GetLicenseOrganizationAddressWin =
      _GetLicenseOrganizationAddressPtrWin.asFunction<
          int Function(CSTRTYPE_WIN, int)>();
  late final _GetLicenseOrganizationAddressPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, Uint32)>>(
          'GetLicenseOrganizationAddressInternal');
  late final _GetLicenseOrganizationAddress = _GetLicenseOrganizationAddressPtr
      .asFunction<int Function(CSTRTYPE, int)>();

  int GetLicenseEntitlementSetName(CSTRTYPE name, int length) {
    if (Platform.isWindows) {
      return _GetLicenseEntitlementSetNameWin(name.cast(), length);
    }
    return _GetLicenseEntitlementSetName(name, length);
  }

  late final _GetLicenseEntitlementSetNamePtr = _lookup<
      NativeFunction<Int32 Function(CSTRTYPE, Uint32)>>(
      'GetLicenseEntitlementSetName');
  late final _GetLicenseEntitlementSetName =
      _GetLicenseEntitlementSetNamePtr.asFunction<
          int Function(CSTRTYPE, int)>();

  late final _GetLicenseEntitlementSetNamePtrWin = _lookup<
      NativeFunction<Int32 Function(CSTRTYPE_WIN, Uint32)>>(
      'GetLicenseEntitlementSetName');
  late final _GetLicenseEntitlementSetNameWin =
      _GetLicenseEntitlementSetNamePtrWin.asFunction<
          int Function(CSTRTYPE_WIN, int)>();

  int GetLicenseEntitlementSetDisplayName(CSTRTYPE name, int length) {
    if (Platform.isWindows) {
      return _GetLicenseEntitlementSetDisplayNameWin(name.cast(), length);
    }
    return _GetLicenseEntitlementSetDisplayName(name, length);
  }

  late final _GetLicenseEntitlementSetDisplayNamePtr = _lookup<
      NativeFunction<Int32 Function(CSTRTYPE, Uint32)>>(
      'GetLicenseEntitlementSetDisplayName');
  late final _GetLicenseEntitlementSetDisplayName =
      _GetLicenseEntitlementSetDisplayNamePtr.asFunction<
          int Function(CSTRTYPE, int)>(); 

  late final _GetLicenseEntitlementSetDisplayNamePtrWin = _lookup<
      NativeFunction<Int32 Function(CSTRTYPE_WIN, Uint32)>>(
      'GetLicenseEntitlementSetDisplayName');
  late final _GetLicenseEntitlementSetDisplayNameWin =
      _GetLicenseEntitlementSetDisplayNamePtrWin.asFunction<
          int Function(CSTRTYPE_WIN, int)>();


  int GetFeatureEntitlements(
    CSTRTYPE array,
    int length,
  ) {
    if (Platform.isWindows) {
      return _GetFeatureEntitlementsWin(array.cast(), length);
    }
    return _GetFeatureEntitlements(array, length);
  }

  late final _GetFeatureEntitlementsPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, Uint32)>>(
          'GetFeatureEntitlementsInternal');
  late final _GetFeatureEntitlements =
      _GetFeatureEntitlementsPtr.asFunction<int Function(CSTRTYPE, int)>();

  late final _GetFeatureEntitlementsPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN, Uint32)>>(
          'GetFeatureEntitlementsInternal');
  late final _GetFeatureEntitlementsWin =
      _GetFeatureEntitlementsPtrWin.asFunction<int Function(CSTRTYPE_WIN, int)>();

  int GetFeatureEntitlement(
    String featureName,
    CSTRTYPE value,
    int length,
  ) {
    late final int result;
    if (Platform.isWindows) {
      final string = featureName.toNativeUtf16();
      result = _GetFeatureEntitlementWin(string, value.cast(), length);
      calloc.free(string);
      return result;
    }
    final string = featureName.toNativeUtf8();
    result = _GetFeatureEntitlement(string, value, length);
    calloc.free(string);
    return result;
  }

  late final _GetFeatureEntitlementPtr = _lookup<
      NativeFunction<Int32 Function(CSTRTYPE, CSTRTYPE, Uint32)>>(
      'GetFeatureEntitlementInternal');
  late final _GetFeatureEntitlement = _GetFeatureEntitlementPtr.asFunction<
      int Function(CSTRTYPE, CSTRTYPE, int)>();

  late final _GetFeatureEntitlementPtrWin = _lookup<
      NativeFunction<Int32 Function(CSTRTYPE_WIN, CSTRTYPE_WIN, Uint32)>>(
      'GetFeatureEntitlementInternal');
  late final _GetFeatureEntitlementWin = _GetFeatureEntitlementPtrWin.asFunction<
      int Function(CSTRTYPE_WIN, CSTRTYPE_WIN, int)>();

  int GetUserLicenses(
    CSTRTYPE array,
    int length,
  ) {
    if (Platform.isWindows) {
      return _GetUserLicensesWin(array.cast(), length);
    }
    return _GetUserLicenses(array, length);
  }

  late final _GetUserLicensesPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, Uint32)>>(
          'GetUserLicensesInternal');
  late final _GetUserLicenses =
      _GetUserLicensesPtr.asFunction<int Function(CSTRTYPE, int)>();

  late final _GetUserLicensesPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN, Uint32)>>(
          'GetUserLicensesInternal');
  late final _GetUserLicensesWin =
      _GetUserLicensesPtrWin.asFunction<int Function(CSTRTYPE_WIN, int)>();

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
  int GetActivationId(
    CSTRTYPE activationId,
    int length,
  ) {
    if (Platform.isWindows) {
      return _GetActivationIdWin(activationId.cast(), length);
    }
    return _GetActivationId(activationId, length);
  }

  late final _GetActivationIdPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, Uint32)>>(
          'GetActivationId');
  late final _GetActivationId =
      _GetActivationIdPtr.asFunction<int Function(CSTRTYPE, int)>();

  late final _GetActivationIdPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN, Uint32)>>(
          'GetActivationId');
  late final _GetActivationIdWin =
      _GetActivationIdPtrWin.asFunction<int Function(CSTRTYPE_WIN, int)>();

  int GetActivationMetadata(
    String key,
    CSTRTYPE value,
    int length,
  ) {
    late final int result;
    if (Platform.isWindows) {
      final string = (key).toNativeUtf16();
      result = _GetActivationMetadataWin(
        string,
        value.cast(),
        length,
      );
      calloc.free(string);
      return result;
    }
    final string = (key).toNativeUtf8();
    result = _GetActivationMetadata(
      string,
      value.cast(),
      length,
    );
    calloc.free(string);
    return result;
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

  int GetActivationMode(
    CSTRTYPE initialMode,
    int initialModeLength,
    CSTRTYPE currentMode,
    int currentModeLength,
  ) {
    if (Platform.isWindows) {
      return _GetActivationModeWin(
        initialMode.cast(),
        initialModeLength,
        currentMode.cast(),
        currentModeLength,
      );
    }
    return _GetActivationMode(
      initialMode,
      initialModeLength,
      currentMode,
      currentModeLength,
    );
  }

  late final _GetActivationModePtr = _lookup<
          NativeFunction<Int32 Function(CSTRTYPE, Uint32, CSTRTYPE, Uint32)>>(
      'GetActivationMode');
  late final _GetActivationMode = _GetActivationModePtr.asFunction<
      int Function(CSTRTYPE, int, CSTRTYPE, int)>();

  late final _GetActivationModePtrWin = _lookup<
      NativeFunction<
          Int32 Function(Pointer<Uint8>, Uint32, Pointer<Uint8>,
              Uint32)>>('GetActivationMode');
  late final _GetActivationModeWin = _GetActivationModePtrWin.asFunction<
      int Function(Pointer<Uint8>, int, Pointer<Uint8>, int)>();

  int GetActivationMeterAttributeUses(
    String name,
    Pointer<Uint32> uses,
  ) {
    late final int result;
    if (Platform.isWindows) {
      final string = (name).toNativeUtf16();
      result = _GetActivationMeterAttributeUsesWin(
        string,
        uses,
      );
      calloc.free(string);
      return result;
    }
    final string = (name).toNativeUtf8();
    result = _GetActivationMeterAttributeUses(
      string,
      uses,
    );
    calloc.free(string);
    return result;
  }

  late final _GetActivationMeterAttributeUsesPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, Pointer<Uint32>)>>(
          'GetActivationMeterAttributeUses');
  late final _GetActivationMeterAttributeUses =
      _GetActivationMeterAttributeUsesPtr.asFunction<
          int Function(CSTRTYPE, Pointer<Uint32>)>();

  late final _GetActivationMeterAttributeUsesPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN, Pointer<Uint32>)>>(
          'GetActivationMeterAttributeUses');
  late final _GetActivationMeterAttributeUsesWin =
      _GetActivationMeterAttributeUsesPtrWin.asFunction<
          int Function(CSTRTYPE_WIN, Pointer<Uint32>)>();

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
    late final int result;
    if (Platform.isWindows) {
      final string = (key).toNativeUtf16();
      result = _GetTrialActivationMetadataWin(
        string,
        value.cast(),
        length,
      );
      calloc.free(string);
      return result;
    }
    final string = (key).toNativeUtf8();
    result = _GetTrialActivationMetadata(
      string,
      value.cast(),
      length,
    );
    calloc.free(string);
    return result;
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

  int CheckForReleaseUpdate(
    String platform,
    String version,
    String channel,
    ReleaseCallbackType releaseUpdateCallback,
  ) {
    if (Platform.isWindows) {
      return _CheckForReleaseUpdateWin(
        platform.toNativeUtf16(),
        version.toNativeUtf16(),
        channel.toNativeUtf16(),
        releaseUpdateCallback,
      );
    }
    return _CheckForReleaseUpdate(
      platform.toNativeUtf8(),
      version.toNativeUtf8(),
      channel.toNativeUtf8(),
      releaseUpdateCallback,
    );
  }

  late final _CheckForReleaseUpdatePtr = _lookup<
      NativeFunction<
          Int32 Function(CSTRTYPE, CSTRTYPE, CSTRTYPE,
              ReleaseCallbackType)>>('CheckForReleaseUpdate');
  late final _CheckForReleaseUpdate = _CheckForReleaseUpdatePtr.asFunction<
      int Function(CSTRTYPE, CSTRTYPE, CSTRTYPE, ReleaseCallbackType)>();

  late final _CheckForReleaseUpdatePtrWin = _lookup<
      NativeFunction<
          Int32 Function(CSTRTYPE_WIN, CSTRTYPE_WIN, CSTRTYPE_WIN,
              ReleaseCallbackType)>>('CheckForReleaseUpdate');
  late final _CheckForReleaseUpdateWin =
      _CheckForReleaseUpdatePtrWin.asFunction<
          int Function(
              CSTRTYPE_WIN, CSTRTYPE_WIN, CSTRTYPE_WIN, ReleaseCallbackType)>();

  // int CheckReleaseUpdate(
  //   NativeCallable<CallbackFuncReleaseUpdate> releaseUpdateCallback,
  //   int flag,
  // ) {

  //   return _CheckReleaseUpdate(
  //       releaseUpdateCallback.nativeFunction, flag, nullptr);
  // }

  // late final _CheckReleaseUpdatePtr = _lookup<
  //     NativeFunction<
  //         Int32 Function(CallbackFuncReleaseType, Uint32,
  //             Pointer<Void>)>>('CheckReleaseUpdateInternal');
  // late final _CheckReleaseUpdate = _CheckReleaseUpdatePtr.asFunction<
  //     int Function(CallbackFuncReleaseType, int, Pointer<Void>)>();

  int AuthenticateUser(
    String email,
    String password,
  ) {
    late final int result;
    if (Platform.isWindows) {
      final string = email.toNativeUtf16();
      final string2 = password.toNativeUtf16();
      result = _AuthenticateUserWin(
        string,
        string2,
      );
      calloc.free(string);
      calloc.free(string2);
      return result;
    }
    final string = email.toNativeUtf8();
    final string2 = password.toNativeUtf8();
    result = _AuthenticateUser(
      string,
      string2,
    );
    calloc.free(string);
    calloc.free(string2);
    return result;
  }

  late final _AuthenticateUserPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE, CSTRTYPE)>>(
          'AuthenticateUser');
  late final _AuthenticateUser =
      _AuthenticateUserPtr.asFunction<int Function(CSTRTYPE, CSTRTYPE)>();
  late final _AuthenticateUserPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN, CSTRTYPE_WIN)>>(
          'AuthenticateUser');
  late final _AuthenticateUserWin = _AuthenticateUserPtrWin.asFunction<
      int Function(CSTRTYPE_WIN, CSTRTYPE_WIN)>();

  int AuthenticateUserWithIdToken(
    String idToken,
  ) {
    late final int result;
    if (Platform.isWindows) {
      final string = idToken.toNativeUtf16();
      result = _AuthenticateUserWithIdTokenWin(string);
      calloc.free(string);
      return result;
    }
    final string = idToken.toNativeUtf8();
    result = _AuthenticateUserWithIdToken(string);
    calloc.free(string);
    return result;
  }

  late final _AuthenticateUserWithIdTokenPtr =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE)>>(
          'AuthenticateUserWithIdToken');
  late final _AuthenticateUserWithIdToken =
      _AuthenticateUserWithIdTokenPtr.asFunction<int Function(CSTRTYPE)>();

  late final _AuthenticateUserWithIdTokenPtrWin =
      _lookup<NativeFunction<Int32 Function(CSTRTYPE_WIN)>>(
          'AuthenticateUserWithIdToken');
  late final _AuthenticateUserWithIdTokenWin =
      _AuthenticateUserWithIdTokenPtrWin.asFunction<
          int Function(CSTRTYPE_WIN)>();

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
    late final int result;
    if (Platform.isWindows) {
      final string = filePath.toNativeUtf16();
      result = _ActivateLicenseOfflineWin(string);
      calloc.free(string);
      return result;
    }
    final string = filePath.toNativeUtf8();
    result = _ActivateLicenseOffline(string);
    calloc.free(string);
    return result;
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
    late final int result;
    if (Platform.isWindows) {
      final string = filePath.toNativeUtf16();
      result = _GenerateOfflineActivationRequestWin(string);
      calloc.free(string);
      return result;
    }
    final string = filePath.toNativeUtf8();
    result = _GenerateOfflineActivationRequest(string);
    calloc.free(string);
    return result;
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
    late final int result;
    if (Platform.isWindows) {
      final string = filePath.toNativeUtf16();
      result = _GenerateOfflineDeactivationRequestWin(string);
      calloc.free(string);
      return result;
    }
    final string = filePath.toNativeUtf8();
    result = _GenerateOfflineDeactivationRequest(string);
    calloc.free(string);
    return result;
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
    late final int result;
    if (Platform.isWindows) {
      final string = filePath.toNativeUtf16();
      result = _ActivateTrialOfflineWin(string);
      calloc.free(string);
      return result;
    }
    final string = filePath.toNativeUtf8();
    result = _ActivateTrialOffline(string);
    calloc.free(string);
    return result;
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
    late final int result;
    if (Platform.isWindows) {
      final string = filePath.toNativeUtf16();
      result = _GenerateOfflineTrialActivationRequestWin(string);
      calloc.free(string);
      return result;
    }
    final string = filePath.toNativeUtf8();
    result = _GenerateOfflineTrialActivationRequest(string);
    calloc.free(string);
    return result;
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
    late final int result;
    if (Platform.isWindows) {
      final string = (name).toNativeUtf16();
      result = _IncrementActivationMeterAttributeUsesWin(
        string,
        increment,
      );
      calloc.free(string);
      return result;
    }
    final string = (name).toNativeUtf8();
    result = _IncrementActivationMeterAttributeUses(
      string,
      increment,
    );
    calloc.free(string);
    return result;
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
    late final int result;
    if (Platform.isWindows) {
      final string = (name).toNativeUtf16();
      result = _DecrementActivationMeterAttributeUsesWin(
        string,
        decrement,
      );
      calloc.free(string);
      return result;
    }
    final string = (name).toNativeUtf8();
    result = _DecrementActivationMeterAttributeUses(
      string,
      decrement,
    );
    calloc.free(string);
    return result;
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
    late final int result;
    if (Platform.isWindows) {
      final string = (name).toNativeUtf16();
      result = _ResetActivationMeterAttributeUsesWin(
        string,
      );
      calloc.free(string);
      return result;
    }
    final string = (name).toNativeUtf8();
    result = _ResetActivationMeterAttributeUses(
      string,
    );
    calloc.free(string);
    return result;
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
}

base class max_align_t extends Opaque {}

typedef CSTRTYPE = Pointer<Utf8>;

typedef CSTRTYPE_WIN = Pointer<Utf16>;

typedef LicenseCallbackType = Pointer<NativeFunction<Void Function(Uint32)>>;
typedef LicenseCallbackFunc = Void Function(Uint32);
typedef LicenseCallbackFuncDart = void Function(int);
typedef ReleaseCallbackType = Pointer<NativeFunction<Void Function(Uint32)>>;
typedef ReleaseCallbackFunc = Void Function(Uint32);
typedef ReleaseCallbackFuncDart = void Function(int);
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
