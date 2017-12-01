import 'dart:html';

import 'package:mockito/mockito.dart';

export 'dart:html';

export 'package:mockito/mockito.dart';
export 'package:test/test.dart';

export '../lib/environment.dart';

class NavigatorMock extends Mock implements Navigator {
}

class WindowMock extends Mock implements Window {
  Navigator navigator = new NavigatorMock();
}
