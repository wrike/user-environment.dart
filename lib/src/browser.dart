import 'package:browser_detect/browser_detect.dart';

import 'browser_type.dart';

export 'package:browser_detect/browser_detect.dart';

abstract class UserBrowser {

  BrowserType get type;
  BrowserVersion get version;
  BrowserVersion getFeatureVersion(String productTitle);
}
