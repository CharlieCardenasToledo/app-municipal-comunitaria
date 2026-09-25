import 'package:flutter_test/flutter_test.dart';
import 'package:civic_horizon/main.dart' as app;

void main() {
  testWidgets('App loads correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const app.CivicHorizonApp());
    expect(find.text('Mi Zamora'), findsOneWidget);
  });
}
