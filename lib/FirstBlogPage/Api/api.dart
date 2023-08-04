
import 'package:blogapp/FirstBlogPage/Models/blog.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SecondApiService {
  Future<List<SecondBlog>> fetchData() async {
    String url =
        'https://api.notion.com/v1/blocks/8e33620175f74a4e8ed84f5abc23f616/children?page_size=200';

    Map<String, String> headers = {
      'Notion-Version': '2022-02-22',
      'Authorization':
          'Bearer secret_6FUwEepND9KKRbw6SUxYailRLqVEMbsnhs5DgQxzIQ3',
    };
    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print("json:$jsonData"); // Check the jsonData in the console
      final results = jsonData['results'] as List;
      print(results); // Check the results list in the console
      return results.map((data) => SecondBlog.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}