![travis build](https://travis-ci.org/wrike/user-environment.dart.svg?branch=deploy)
## User Environment
This package allows to detect the platform and the browser version used to view a web page.

Differentiated browsers are: `IE`, `Edge`, `Chrome`, `Safari`, `Firefox`, `Opera`, `Electron`, `Other` along with `Mac`, `Windows` and `Other` platforms. 

### Usage
```dart
  import 'package:user_environment/user_environment.dart';
  void main() {
    UserEnvironment env = UserEnvironmentFactory();
    print([
      env.browser.type,
      env.browser.version?.value,
      env.browser.getFeatureVersion('AppleWebKit'),
      env.platform.type
    ]);
  }
```

### Running tests

  pub serve test
  pub run test -p chrome
