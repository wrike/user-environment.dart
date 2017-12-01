@TestOn('browser')

import '../lib/src/environment_impl.dart';
import 'common.dart';

void main() {

  Window windowMock = new WindowMock();
  when(windowMock.navigator.userAgent).thenReturn("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246");

  group('UserEnvironment', () {

    test('UserEnvironmentImpl', () {
      UserEnvironment environment = new UserEnvironmentImpl.fromWindow(windowMock);

      expect(environment.browser.type, BrowserType.Edge);
      expect(environment.platform.type, UserPlatformType.Windows);
    });

  });

}
