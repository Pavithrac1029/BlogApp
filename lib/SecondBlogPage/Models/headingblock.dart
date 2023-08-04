import 'package:blogapp/FirstBlogPage/Models/blog.dart';
import 'package:blogapp/FirstBlogPage/Models/blogspan.dart';
import 'package:blogapp/SecondBlogPage/Models/blog.dart';
import 'package:blogapp/SecondBlogPage/Models/blogspan.dart';

import 'package:flutter/material.dart';
class ThirdHeadingBlock extends ThirdBlog {
  ThirdHeadingBlock({
    required List<ThirdBlogSpan> content,
    required String url,
  }) : super(content: content, url: url);

  factory ThirdHeadingBlock.fromJson(Map<String, dynamic> json) {
    final richText = json['heading_3']?['rich_text'] as List<dynamic>?;

    List<ThirdBlogSpan> content = [];
    if (richText != null && richText.isNotEmpty) {
      for (var spanData in richText) {
        final plainText = spanData['plain_text'];
        final isBold = spanData['annotations']?['bold'] == true;
        final isItalic = spanData['annotations']?['italic'] == true;

        TextStyle style = TextStyle(
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
          fontSize: 18, // Set the font size for heading_3
        );

        content.add(ThirdBlogSpan(text: plainText, style: style));
      }
    }

    return ThirdHeadingBlock(content: content, url: '');
  }
}