import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/experience.dart';

class ApiService {
  static Future<List<Experience>> fetchExperiences() async {
    final url = Uri.parse("https://staging.chamberofsecrets.8club.co/v1/experiences?active=true");
    final response = await http.get(url);

    final data = jsonDecode(response.body);
    final list = data['data']['experiences'] as List;

    return list.map((e) => Experience.fromJson(e)).toList();
  }
}
