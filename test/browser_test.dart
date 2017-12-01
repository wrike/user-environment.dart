@TestOn('browser')

import 'package:browser_detect/browser_detect.dart' as detected;

import '../lib/src/browser_impl.dart';
import 'common.dart';

void main() {

  Navigator navigator = new NavigatorMock();

  group('UserBrowserImpl', () {

    test('Should use common abilities from browser_detect', () {
      UserBrowser browser = new UserBrowserImpl(window.navigator);

      if (detected.browser.isChrome) {
        expect(browser.type, BrowserType.Chrome);
      }
      if (detected.browser.isFirefox) {
        expect(browser.type, BrowserType.Firefox);
      }
      if (detected.browser.isSafari) {
        expect(browser.type, BrowserType.Safari);
      }
      if (detected.browser.isOpera) {
        expect(browser.type, BrowserType.Opera);
      }

      expect(browser.version, detected.browser.version);
    });

    test('Should detect Edge', () {
      when(navigator.userAgent).thenReturn("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246");

      UserBrowser browser = new UserBrowserImpl(navigator);

      expect(browser.type, BrowserType.Edge);
      expect(browser.version, detected.browser.version);
    });

    test('Should detect IE', () {
      when(navigator.userAgent).thenReturn("Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)");
      UserBrowser browser = new UserBrowserImpl(navigator);

      if (detected.browser.isIe) {
        expect(browser.type, BrowserType.IE);
        expect(browser.version, detected.browser.version);
      }
    });

    test('Should detect proper product version', () {
      when(navigator.userAgent).thenReturn("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Electron/1.6.11 Safari/537.36");
      UserBrowser browser = new UserBrowserImpl(navigator);

      expect(browser.type, BrowserType.Electron);
      expect(browser.version.value, '1.6.11');
    });

    test('Should detect proper product version', () {
      when(navigator.userAgent).thenReturn("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36");
      UserBrowser browser = new UserBrowserImpl(navigator);

      expect(browser.type, BrowserType.Chrome);

      BrowserVersion productVersion = browser.getFeatureVersion('safari');
      expect(productVersion.value, '537.36');
    });

    test('Should not detect improper product version', () {
      when(navigator.userAgent).thenReturn("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Electron Safari");

      expect(new UserBrowserImpl(navigator).getFeatureVersion('safari'), isNull);
    });

  });

}
