
import 'package:blogapp/FirstBlogPage/Models/blog.dart';
import 'package:blogapp/SecondBlogPage/Models/blog.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ThirdApiService {
  Future<List<ThirdBlog>> fetchData() async {
    String url =
        'https://api.notion.com/v1/blocks/e703c23f32544f15901f9ad53e47c74a/children?page_size=200';

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
      return results.map((data) => ThirdBlog.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}