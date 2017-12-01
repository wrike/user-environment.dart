@TestOn('browser')

import '../lib/src/platform_impl.dart';
import 'common.dart';

void main() {

  Navigator navigator = new NavigatorMock();

  group('UserPlatformImpl', () {

    test('Should detect Mac OS', () {
      when(navigator.userAgent).thenReturn("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.95 Safari/537.36");
      UserPlatform platform = new UserPlatformImpl(navigator);

      expect(platform.type, UserPlatformType.Mac);
    });

    test('Should detect Windows', () {
      when(navigator.userAgent).thenReturn("Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)");
      UserPlatform platform = new UserPlatformImpl(navigator);

      expect(platform.type, UserPlatformType.Windows);
    });

    test('Should detect any other platform', () {
      when(navigator.userAgent).thenReturn("Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:34.0) Gecko/20100101 Firefox/34.0");
      UserPlatform platform = new UserPlatformImpl(navigator);

      expect(platform.type, UserPlatformType.Other);
    });

  });

}
