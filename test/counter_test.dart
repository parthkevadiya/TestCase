import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:tdd_test_case/counter_test_case_widget/counter.dart';
import 'package:tdd_test_case/counter_test_case_widget/counter_screen.dart';

void main() {
  testWidgets('Counter increments when tap floating action button', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => Counter(),
        child: const MaterialApp(home: CounterScreen()),
      ),
    );

    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
  });
}
