import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import "package:integration_test/integration_test.dart";

import 'package:counter_app_mobx/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group("end-to-end test", () {
    testWidgets("counter_button_test", (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // check that counter start from 0
      // expect(find.text("0"), find.byKey(const Key("counter_value")));

      // find the floating action button to tap on
      final Finder button = find.byKey(const Key("Increment_button"));

      // perform a tap on the button
      await tester.tap(button);
      await tester.pumpAndSettle();

      // check the result is == 1
      expect(find.text("1"), findsOneWidget);
    });
  });
}
