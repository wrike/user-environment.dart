import 'dart:html';
import 'dart:js';

import 'package:browser_detect/browser_detect.dart';

import 'browser_type.dart';
import 'browser.dart';

class UserBrowserImpl implements UserBrowser {

  static const String _MS_IE_JS_DOCMODE_NAME = 'documentMode';

  final BrowserType type;
  final BrowserVersion version;
  final String _userAgent;

  factory UserBrowserImpl(Navigator navigator) {
    String userAgent = navigator.userAgent.toLowerCase();

    if (userAgent.contains('edge')) {
      return new UserBrowserImpl._(BrowserType.Edge, browser.version, navigator);
    }

    if (userAgent.contains('electron')) {
      BrowserVersion electronVersion = _getFeatureVersion('electron', userAgent);
      if (electronVersion != null) {
        return new UserBrowserImpl._(BrowserType.Electron, electronVersion, navigator);
      }
    }

    if (browser.isChrome) {
      return new UserBrowserImpl._(BrowserType.Chrome, browser.version, navigator);
    }
    if (browser.isFirefox) {
      return new UserBrowserImpl._(BrowserType.Firefox, browser.version, navigator);
    }
    if (browser.isSafari) {
      return new UserBrowserImpl._(BrowserType.Safari, browser.version, navigator);
    }
    if (browser.isOpera) {
      return new UserBrowserImpl._(BrowserType.Opera, browser.version, navigator);
    }

    if (browser.isIe) {
      JsObject documentObj = new JsObject.fromBrowserObject(document);
      int docMode;

      if (documentObj.hasProperty(_MS_IE_JS_DOCMODE_NAME)) {
        docMode = documentObj[_MS_IE_JS_DOCMODE_NAME];
      }
      bool isQuirksDocMode = docMode == null || docMode == 5;

      if ((userAgent.contains('trident/7.0') && isQuirksDocMode) || docMode == 11) {
        return new UserBrowserImpl._(BrowserType.IE, new BrowserVersion('11'), navigator);
      }

      if ((userAgent.contains('msie 10') && docMode != 7 && docMode != 8 && docMode != 9) || docMode == 10) {
        return new UserBrowserImpl._(BrowserType.IE, new BrowserVersion('10'), navigator);
      }

      return new UserBrowserImpl._(BrowserType.IE, browser.version, navigator);
    }

    return new UserBrowserImpl._(BrowserType.Other, browser.version, navigator);
  }


  UserBrowserImpl._(this.type, this.version, Navigator navigator):
    _userAgent = navigator.userAgent.toLowerCase()
  ;

  static BrowserVersion _getFeatureVersion(String featureTitle, String userAgent) {
    RegExp matcher = new RegExp(featureTitle?.toLowerCase() + r'/([\d|.]+)');
    String version = matcher.firstMatch(userAgent)?.group(1);
    return version == null ? null : new BrowserVersion(version);
  }

  BrowserVersion getFeatureVersion(String productTitle) =>
    _getFeatureVersion(productTitle, _userAgent);

}
