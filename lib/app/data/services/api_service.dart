import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = 'https://fake-api.tractian.com';

  Future<List<dynamic>> fetchData(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
    if (response.statusCode == 200) {
      print('sucess fteching!');
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
