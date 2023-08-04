import 'package:blogapp/FirstBlogPage/Models/blog.dart';
import 'package:blogapp/FirstBlogPage/Models/blogspan.dart';
import 'package:blogapp/SecondBlogPage/Models/blog.dart';
import 'package:blogapp/SecondBlogPage/Models/blogspan.dart';

import 'package:flutter/material.dart';

class ThirdHeading3Block extends ThirdBlog {
  ThirdHeading3Block({
    required List<ThirdBlogSpan> content,
    required String url,
  }) : super(content: content, url: url);

  factory ThirdHeading3Block.fromJson(Map<String, dynamic> json) {
    final richText = json['heading_3']?['rich_text'] as List<dynamic>?;

    List<ThirdBlogSpan> content = [];
    if (richText != null && richText.isNotEmpty) {
      for (var spanData in richText) {
        final plainText = spanData['plain_text'];

        TextStyle style = TextStyle(
          fontSize: 20, // Adjust the font size for heading_3
          fontWeight: FontWeight.bold,
        );

        content.add(ThirdBlogSpan(text: "${plainText}", style: style));
      }
    }

    return ThirdHeading3Block(content: content, url: '');
  }
}