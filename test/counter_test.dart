import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_test_case/counter.dart';

void main() {
  test('Counter should start at 0', () {
    final counter = Counter();
    expect(counter.value, 0);
  });

  test('Increment', () {
    final counter = Counter();
    counter.increment();
    expect(counter.value, 1);
  });

  test('Decrement', () {
    final counter = Counter();
    counter.decrement();
    expect(counter.value, -1);
  });
}
