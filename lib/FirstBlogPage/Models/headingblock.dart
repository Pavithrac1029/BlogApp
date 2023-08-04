import 'package:blogapp/FirstBlogPage/Models/blog.dart';
import 'package:blogapp/FirstBlogPage/Models/blogspan.dart';

import 'package:flutter/material.dart';
class SecondHeadingBlock extends SecondBlog {
  SecondHeadingBlock({
    required List<SecondBlogSpan> content,
    required String url,
  }) : super(content: content, url: url);

  factory SecondHeadingBlock.fromJson(Map<String, dynamic> json) {
    final richText = json['heading_3']?['rich_text'] as List<dynamic>?;

    List<SecondBlogSpan> content = [];
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

        content.add(SecondBlogSpan(text: plainText, style: style));
      }
    }

    return SecondHeadingBlock(content: content, url: '');
  }
}