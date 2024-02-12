import 'package:flutter_test/flutter_test.dart';
import 'package:your_project/main.dart'; // Replace with the actual import

void main() {
  testWidgets('WidgetTester Test', (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(MyApp());

    // Find a widget by key and perform an action
    await tester.tap(find.byKey(Key('item_1')));

    // Allow time for animations to complete
    await tester.pumpAndSettle();

    // Verify the expected changes in the widget tree
    expect(find.text('Item 1 Text'), findsNothing);
    expect(find.text('Item 2 Text'), findsOneWidget);
  });
}
