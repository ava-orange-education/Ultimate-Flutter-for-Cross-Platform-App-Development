import 'package:flutter_test/flutter_test.dart';
import 'package:widget_finder_example/main.dart';

void main() {
  testWidgets('Find Widgets using Finder Methods', (tester) async {
    await tester.pumpWidget(MyApp());

    // Find widgets by type
    expect(find.byType(ListItem), findsNWidgets(2));

    // Find widgets by key
    expect(find.byKey(Key('item_1')), findsOneWidget);
    expect(find.byKey(Key('item_2')), findsOneWidget);

    // Find widgets by tooltip
    expect(find.byTooltip('Item 1 Tooltip'), findsOneWidget);
    expect(find.byTooltip('Item 2 Tooltip'), findsOneWidget);

    // Find widgets by text
    expect(find.text('Item 1 Text'), findsOneWidget);
    expect(find.text('Item 2 Text'), findsOneWidget);
  });
}
