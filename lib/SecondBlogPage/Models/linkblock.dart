import 'package:blogapp/FirstBlogPage/Models/blog.dart';
import 'package:blogapp/FirstBlogPage/Models/blogspan.dart';
import 'package:blogapp/SecondBlogPage/Models/blog.dart';
import 'package:blogapp/SecondBlogPage/Models/blogspan.dart';
import 'package:flutter/material.dart';



class ThirdLinkBlock extends ThirdBlog {
  ThirdLinkBlock({
    required List<ThirdBlogSpan> content,
    required String url,
  }) : super(content: content, url: url);

  factory ThirdLinkBlock.fromJson(Map<String, dynamic> json) {
    final url = json['link']?['url'] ?? '';
    return ThirdLinkBlock(content: [], url: url);
  }
}