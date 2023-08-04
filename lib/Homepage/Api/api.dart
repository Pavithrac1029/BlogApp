import 'package:blogapp/Homepage/Models/blog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future<List<Blog>> fetchData() async {
    String url =
        'https://api.notion.com/v1/blocks/e45f355a4cb442fab0c22521e88912ec/children?page_size=200';

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
      return results.map((data) => Blog.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
