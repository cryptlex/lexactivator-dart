// ignore_for_file: avoid_print
import 'package:lexactivator/lexactivator.dart';

void main() {
  initializeLexActivator();
  activateLicense();

  try {
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

///Initialize function is always called at the start of your application or within
///the scope of use of LexActivator
void initializeLexActivator() {
  LexActivator.SetProductData(productData: "PASTE_CONTENT_OF_PRODUCT.DAT_FILE");

  LexActivator.SetProductId(
      productId: "PASTE_PRODUCT_ID", flags: LexActivator.LA_USER);

  LexActivator.SetAppVersion(appVersion: 'PASTE_YOUR_APP_VERSION');
}

///Activation function is called once when license is to be activated. Calling this function
///again is not required.
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

void activateTrial() {
  LexActivator.SetTrialActivationMetadata(
      key: 'Trial Metadata 1', value: 'Value 1');
  final status = LexActivator.ActivateTrial();
  if (LexStatusCodes.LA_OK == status) {
    print('Product trial activated successfully!');
  } else if (LexStatusCodes.LA_TRIAL_EXPIRED == status) {
    print('Product trial has expired!');
  } else {
    print('Product trial activation failed: $status');
  }
}
