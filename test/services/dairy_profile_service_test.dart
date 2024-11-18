import 'package:flutter_test/flutter_test.dart';
import 'package:diary_project/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('DairyProfileServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}