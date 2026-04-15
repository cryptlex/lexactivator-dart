## 3.41.2
* Increased the buffer size for GetFeatureEntitlements()

## 3.41.1
* Minor bug fix.

## 3.41.0
* Added SyncLicenseActivation() function which synchronizes the activation data with the Cryptlex servers.
* Added SyncTrialActivation() function which synchronizes the trial activation data with the Cryptlex servers.

## 3.40.0
* Added baseValue property to the FeatureEntitlement object returned by GetFeatureEntitlement() function.

## 3.39.1
* Minor bug fix.

## 3.39.0
* Added GetLicenseEntitlementSetTier() function which returns the tier of the license entitlement set.

## 3.38.0
* Added support for migration of activation data from LA_USER and LA_SYSTEM to LA_ALL_USERS for macOS and Windows.

## 3.37.0
* Added expiresAt to Feature Entitlements.
* Added totalActivations and totalDeactivations to User License. 

## 3.36.0
* Added GetLastActivationError() which returns the error code that caused the activation data to be cleared.
* Minor bug fix.

## 3.35.2
* Minor bug fix.

## 3.35.1
* Minor bug fix.

## 3.35.0
* Added support for wsl detection.

## 3.34.0
* Improved linux OS fingerprint when LA_SYSTEM permission flag is used.
* Minor bug fix.

## 3.33.0
* Added support for x86_64 android.
* Updated libcurl version.

## 3.32.3
* Minor bug fix.

## 3.32.2
* Few bug fixes.

## 3.32.1
* Updated android package version.

## 3.32.0
* Added feature entitlement functions.
* Added activation last synced date getter.

## 3.31.3
* Added missing functions.
* Added support for license callback to know the server sync status.

## 3.5.0
* Minor refactoring.

## 3.2.0
* Added few more functions.

## 3.1.0
* Fixed library loading for all supported platforms.
* Fixed network in example app in accordance with https://flutter.dev/desktop#entitlements-and-the-app-sandbox

## 3.0.0
* Initial release.
