import 'package:blogapp/FirstBlogPage/Models/blog.dart';
import 'package:blogapp/FirstBlogPage/Models/blogspan.dart';
import 'package:blogapp/SecondBlogPage/Models/blog.dart';
import 'package:blogapp/SecondBlogPage/Models/blogspan.dart';
import 'package:flutter/material.dart';

class ThirdVideoBlock extends ThirdBlog {
  ThirdVideoBlock({required List<ThirdBlogSpan> content, required String url})
      : super(content: content, url: url);

  factory ThirdVideoBlock.fromJson(Map<String, dynamic> json) {
    final url = json['video']?['file']?['url'] ?? '';
    return ThirdVideoBlock(content: [], url: url);
  }
}
