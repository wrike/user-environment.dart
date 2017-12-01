import 'dart:html';
import 'environment.dart';
import 'environment_impl.dart';

UserEnvironment _environment;

UserEnvironment UserEnvironmentFactory() {
  return _environment ??= UserEnvironmentFromWindowFactory(window);
}

UserEnvironment UserEnvironmentFromWindowFactory(Window window) =>
  new UserEnvironmentImpl.fromWindow(window);
