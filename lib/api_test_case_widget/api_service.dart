import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final http.Client client;

  ApiService({required this.client});

  Future<String> fetchData() async {
    //Please change url this url for testing purpose
    final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['title'];
    } else {
      throw Exception('Failed to load data');
    }
  }
}
