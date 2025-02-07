import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:tdd_test_case/api_test_case_widget/api_screen.dart';
import 'package:tdd_test_case/api_test_case_widget/api_service.dart';

@GenerateMocks([ApiService])
import 'api_for_widget_test.mocks.dart';

void main() {
  late MockApiService mockApiService;

  setUp(() {
    mockApiService = MockApiService();
  });

  testWidgets('When API loaded', (WidgetTester tester) async {
    when(mockApiService.fetchData()).thenAnswer((_) async => "API Test Data");

    await tester.pumpWidget(
      Provider<ApiService>.value(
        value: mockApiService,
        child: const MaterialApp(home: ApiScreen()),
      ),
    );

    await tester.pump();
    expect(find.text("API Test Data"), findsOneWidget);
  });

  testWidgets('API fails', (WidgetTester tester) async {
    when(mockApiService.fetchData()).thenThrow(Exception("API Error"));
    await tester.pumpWidget(
      Provider<ApiService>.value(
        value: mockApiService,
        child: const MaterialApp(home: ApiScreen()),
      ),
    );
    await tester.pump();
    expect(find.textContaining("Error"), findsOneWidget);
  });
}
