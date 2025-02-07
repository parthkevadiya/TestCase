import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tdd_test_case/counter_test_case_widget/counter.dart';
import 'package:tdd_test_case/counter_test_case_widget/counter_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Counter(),
      child: const MaterialApp(home: CounterScreen()),
    ),
  );
}
