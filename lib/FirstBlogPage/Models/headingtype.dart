import 'package:blogapp/FirstBlogPage/Models/blog.dart';
import 'package:blogapp/FirstBlogPage/Models/blogspan.dart';

import 'package:flutter/material.dart';

class SecondHeading3Block extends SecondBlog {
  SecondHeading3Block({
    required List<SecondBlogSpan> content,
    required String url,
  }) : super(content: content, url: url);

  factory SecondHeading3Block.fromJson(Map<String, dynamic> json) {
    final richText = json['heading_3']?['rich_text'] as List<dynamic>?;

    List<SecondBlogSpan> content = [];
    if (richText != null && richText.isNotEmpty) {
      for (var spanData in richText) {
        final plainText = spanData['plain_text'];

        TextStyle style = TextStyle(
          fontSize: 20, // Adjust the font size for heading_3
          fontWeight: FontWeight.bold,
        );

        content.add(SecondBlogSpan(text: "${plainText}", style: style));
      }
    }

    return SecondHeading3Block(content: content, url: '');
  }
}