import 'package:blogapp/FirstBlogPage/Models/blog.dart';
import 'package:blogapp/FirstBlogPage/Models/blogspan.dart';
import 'package:blogapp/SecondBlogPage/Models/blog.dart';
import 'package:blogapp/SecondBlogPage/Models/blogspan.dart';
import 'package:flutter/material.dart';
class ThirdParagraphBlock extends ThirdBlog {
  ThirdParagraphBlock(
      {required List<ThirdBlogSpan> content, required String url})
      : super(content: content, url: url);

  factory ThirdParagraphBlock.fromJson(Map<String, dynamic> json) {
    final richText = json['paragraph']?['rich_text'] as List<dynamic>?;

    List<ThirdBlogSpan> content = [];
    if (richText != null && richText.isNotEmpty) {
      for (var spanData in richText) {
        final plainText = spanData['plain_text'];
        final isBold = spanData['annotations']?['bold'] == true;
        final isItalic = spanData['annotations']?['italic'] == true;
        final isTitle = spanData['type'] == 'heading_1';

        TextStyle style = TextStyle(
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
        );

        if (isTitle) {
          style = style.copyWith(fontSize: 24, fontWeight: FontWeight.bold);
        }

        content.add(ThirdBlogSpan(text: "${plainText}", style: style));
      }
    }

    return ThirdParagraphBlock(content: content, url: '');
  }

  @override
  List<TextSpan> get convertedContent {
    return content
        .map((span) => TextSpan(text: span.text, style: span.style))
        .toList();
  }
}