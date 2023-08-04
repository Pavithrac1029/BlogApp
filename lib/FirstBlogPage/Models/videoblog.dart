import 'package:blogapp/FirstBlogPage/Models/blog.dart';
import 'package:blogapp/FirstBlogPage/Models/blogspan.dart';
import 'package:flutter/material.dart';

class SecondVideoBlock extends SecondBlog {
  SecondVideoBlock({required List<SecondBlogSpan> content, required String url})
      : super(content: content, url: url);

  factory SecondVideoBlock.fromJson(Map<String, dynamic> json) {
    final url = json['video']?['file']?['url'] ?? '';
    return SecondVideoBlock(content: [], url: url);
  }
}
