import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_test_case/api_test_case_widget/api_service.dart';

@GenerateMocks([http.Client])
import 'api_for_unit_test.mocks.dart';

void main() {
  late MockClient mockClient;
  late ApiService apiService;

  setUp(() {
    mockClient = MockClient();
    apiService = ApiService(client: mockClient);
  });

  test('Response - 200', () async {
    when(mockClient.get(any)).thenAnswer((_) async => http.Response(json.encode({"title": "Test Demo"}), 200));
    final result = await apiService.fetchData();
    expect(result, "Test Demo");
  });

  test('Exception', () async {
    when(mockClient.get(any)).thenAnswer((_) async => http.Response('Error', 404));
    expect(() => apiService.fetchData(), throwsException);
  });
}
