# lexactivator

LexActivator API wrapper for Dart (licensing library) 

## Getting Started

The first thing you need to do is to embed the Product.dat file in your app using the `SetProductData()` function. The next thing you need to do is to set the product id of your application in your code using `SetProductId()` function. It sets the id of the product you will be adding licensing to.

```dart
void initializeLexActivator() {
  LexActivator.SetProductData(productData: "PASTE_CONTENT_OF_PRODUCT.DAT_FILE");

  LexActivator.SetProductId(
      productId: "PASTE_PRODUCT_ID", flags: LexActivator.LA_USER);
}
``` 

## License activation

To activate the license in your app using the license key, you will use ActivateLicense() LexActivator API function. It invokes the /v3/activations Cryptlex Web API endpoint, verifies the encrypted and digitally signed response to validate the license.

```dart
void activateLicense() {
  LexActivator.SetLicenseKey(licenseKey: 'PASTE_LICENSE_KEY');
  LexActivator.SetActivationMetadata(key: 'Metadata 1', value: 'Value 1');
  final status = LexActivator.ActivateLicense();
  if (LexStatusCodes.LA_OK == status) {
    print('License activated successfully!');
  } else if (LexStatusCodes.LA_EXPIRED == status) {
    print('License activated successfully but has expired!');
  } else if (LexStatusCodes.LA_SUSPENDED == status) {
    print('License activated successfully but has been suspended!');
  }
}
```

The above code should be executed at the time of license activation.

## Verifying license activation

Each time, your app starts, you need to verify whether your license is already activated or not. This verification should occur locally by verifying the cryptographic digital signature of activation. Ideally, it should also asynchronously contact Cryptlex servers to validate and sync the license activation periodically. For this you need to use `IsLicenseGenuine()` LexActivator API function.

```dart
void main() {
  try {
    
    initializeLexActivator();

    final status = LexActivator.IsLicenseGenuine();
    if (LexStatusCodes.LA_OK == status) {
      print('License is genuinely activated!');

      final expiryDate = LexActivator.GetLicenseExpiryDate();
      final daysLeft = DateTime.fromMillisecondsSinceEpoch(expiryDate)
          .difference(DateTime.now());
      print('Days left: $daysLeft');

      final userName = LexActivator.GetLicenseUserName();
      print('License user name: $userName');
    } else if (LexStatusCodes.LA_EXPIRED == status) {
      print('License is genuinely activated but has expired!');
    } else if (LexStatusCodes.LA_SUSPENDED == status) {
      print('License is genuinely activated but has been suspended!');
    } else if (LexStatusCodes.LA_GRACE_PERIOD_OVER == status) {
      print('License is genuinely activated but grace period is over!');
    } else {
      final trialStatus = LexActivator.IsTrialGenuine();
      if (LexStatusCodes.LA_OK == trialStatus) {
        final expiryDate = LexActivator.GetTrialExpiryDate();
        final daysLeft = DateTime.fromMillisecondsSinceEpoch(expiryDate)
            .difference(DateTime.now());
        print('Trial days left: $daysLeft');
      } else if (LexStatusCodes.LA_TRIAL_EXPIRED == trialStatus) {
        print('Trial has expired!');
        // Time to buy the license and activate the app
        activateLicense();
      } else {
        print('Either trial has not started or has been tampered!');
        // Activating the trial
        activateTrial();
      }
    }
  } on LexActivatorException catch (e) {
    print(e);
  }
}
```

The above code should be executed every time user starts the app. After verifying locally, it schedules a periodic server check in a separate thread.

## Limitations
The application you are building with the plugin will only build for the host architecture on Linux and Windows i.e. if you are building your application on a Linux x64, it will build for Linux x64 and not for Linux x86 or Linux ARM.