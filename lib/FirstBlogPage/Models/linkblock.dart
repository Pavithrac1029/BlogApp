import 'package:blogapp/FirstBlogPage/Models/blog.dart';
import 'package:blogapp/FirstBlogPage/Models/blogspan.dart';
import 'package:flutter/material.dart';



class SecondLinkBlock extends SecondBlog {
  SecondLinkBlock({
    required List<SecondBlogSpan> content,
    required String url,
  }) : super(content: content, url: url);

  factory SecondLinkBlock.fromJson(Map<String, dynamic> json) {
    final url = json['link']?['url'] ?? '';
    return SecondLinkBlock(content: [], url: url);
  }
}