import 'browser.dart';
import 'platform.dart';

abstract class UserEnvironment {

  UserBrowser get browser;
  UserPlatform get platform;

}
