import 'dart:html';

import 'browser.dart';
import 'browser_impl.dart';
import 'environment.dart';
import 'platform.dart';
import 'platform_impl.dart';

class UserEnvironmentImpl implements UserEnvironment {

  final UserBrowser browser;
  final UserPlatform platform;

  UserEnvironmentImpl(this.browser, this.platform);

  factory UserEnvironmentImpl.fromWindow(Window window) =>
    new UserEnvironmentImpl(
      new UserBrowserImpl(window.navigator),
      new UserPlatformImpl(window.navigator)
    );

}
