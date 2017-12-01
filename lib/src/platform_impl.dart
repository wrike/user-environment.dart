import 'dart:html';
import 'platform.dart';
import 'platform_type.dart';

class UserPlatformImpl implements UserPlatform {

  final UserPlatformType type;

  factory UserPlatformImpl(Navigator navigator) {
    UserPlatformType type = UserPlatformType.Other;
    String userAgent = navigator.userAgent.toLowerCase();

    if (userAgent.contains('mac')) {
      type = UserPlatformType.Mac;
    } else if (userAgent.contains('win')) {
      type = UserPlatformType.Windows;
    }

    return new UserPlatformImpl._(type);
  }

  UserPlatformImpl._(this.type);
}
