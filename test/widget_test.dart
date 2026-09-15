import 'package:flutter_test/flutter_test.dart';
import 'package:ploriva/ploriva_app.dart';

void main() {
  testWidgets('PlorivaApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const PlorivaApp());
    expect(find.text('Ploriva Botanical Hub'), findsOneWidget);
  });
}
