import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tdd_test_case/api_test_case_widget/api_service.dart';

class ApiScreen extends StatelessWidget {
  const ApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Demo API Test")),
      body: Center(
        child: FutureBuilder<String>(
          future: Provider.of<ApiService>(context, listen: false).fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              return Text(snapshot.data ?? "No data", style: const TextStyle(fontSize: 20));
            }
          },
        ),
      ),
    );
  }
}
