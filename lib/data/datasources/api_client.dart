import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  static const String _baseUrl = 'http://www.budatask.com/api/';
  static const String _token = '9868748031cde55bc8365ff3f68097d09933a74e';

  Future<List<dynamic>> get(String path) async {
    final headers = {
      'Authorization': 'Token $_token',
      'Content-Type': 'application/json',
    };
    final uri = Uri.parse(_baseUrl + path);

    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      final apiResponse = json.decode(response.body) as List<dynamic>;
      return apiResponse;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> patch(String path, dynamic data) async {
    final headers = {
      'Authorization': 'Token $_token',
      'Content-Type': 'application/json',
    };
    final body = data;
    final response = await http.patch(
      Uri.parse(_baseUrl + path),
      headers: headers,
      body: body,
    );
    if (response.statusCode == 200) {
      final apiResponse = json.decode(response.body);
      return apiResponse;
    } else {
      throw Exception('Failed to update data');
    }
  }

  Future<dynamic> post(String path, dynamic data) async {
    final headers = {
      'Authorization': 'Token $_token',
      'Content-Type': 'application/json',
    };
    final body = data;
    final response = await http.post(
      Uri.parse(_baseUrl + path),
      headers: headers,
      body: body,
    );
    if (response.statusCode == 201) {
      final apiResponse = json.decode(response.body);
      return apiResponse;
    } else {
      throw Exception('Failed to update data');
    }
  }

  String getToken() => _token;

  Uri getBaseUrl() => Uri.parse(_baseUrl);
}
