import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'services.g.dart';

class ApiService {
  String url = "https://bored.api.lewagon.com/api/activity/";

  Future<String> fetchActivity() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      final result = data['activity'] as String;
      return result;
    } else {
      throw Exception('Failed to load activity');
    }
  }
}

@riverpod
Future<String> task(ref) {
  final apiService = ApiService();
  return apiService.fetchActivity();
}
