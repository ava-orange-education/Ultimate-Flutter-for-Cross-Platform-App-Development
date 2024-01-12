import 'package:flutter_test/flutter_test.dart';
import 'package:widget_finder_example/main.dart';

void main() {
  testWidgets('Use Keys and Accessibility in Tests', (tester) async {
    await tester.pumpWidget(MyApp());

    // Find widgets by key
    expect(find.byKey(Key('item_1')), findsOneWidget);
    expect(find.byKey(Key('item_2')), findsOneWidget);

    // Find widgets by tooltip
    expect(find.byTooltip('Item 1 Tooltip'), findsOneWidget);
    expect(find.byTooltip('Item 2 Tooltip'), findsOneWidget);

    // Find widgets by text
    expect(find.text('Item 1 Text'), findsOneWidget);
    expect(find.text('Item 2 Text'), findsOneWidget);

    // Verify accessibility with Semantics
    expect(
        tester.getSemantics(find.text('Item 1 Text')),
        matchesSemantics(
          label: 'Item 1 Text',
        ));
    expect(
        tester.getSemantics(find.text('Item 2 Text')),
        matchesSemantics(
          label: 'Item 2 Text',
        ));
  });
}
