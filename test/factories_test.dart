@TestOn('browser')

import 'common.dart';

void main() {

  group('UserEnvironmentFactory', () {

    test('Should return the same instance everytime', () {
      UserEnvironment environment = UserEnvironmentFactory();
      expect(environment, equals(UserEnvironmentFactory()));
    });
  });

}
