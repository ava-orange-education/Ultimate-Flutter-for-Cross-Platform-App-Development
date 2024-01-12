import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modern_flutter/heart_rate.dart';

void main() {
  testWidgets('Heart Rate Button Tap Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(HeartMonitoringApp());

    // Tap the button.
    await tester.tap(find.byType(ElevatedButton));

    // Wait for all animations and microtasks to complete.
    await tester.pumpAndSettle(Duration(seconds: 1));

    // Now check for the widget using the key.
    expect(find.byKey(Key('heartRateText')), findsOneWidget);
  });
}
