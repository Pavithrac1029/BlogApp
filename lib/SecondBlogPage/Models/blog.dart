import 'package:blogapp/FirstBlogPage/Models/blogspan.dart';
import 'package:blogapp/FirstBlogPage/Models/headingblock.dart';
import 'package:blogapp/FirstBlogPage/Models/imageblog.dart';
import 'package:blogapp/FirstBlogPage/Models/linkblock.dart';
import 'package:blogapp/FirstBlogPage/Models/paragraphblog.dart';
import 'package:blogapp/FirstBlogPage/Models/videoblog.dart';
import 'package:blogapp/SecondBlogPage/Models/blogspan.dart';
import 'package:blogapp/SecondBlogPage/Models/headingblock.dart';
import 'package:blogapp/SecondBlogPage/Models/imageblog.dart';
import 'package:blogapp/SecondBlogPage/Models/linkblock.dart';
import 'package:blogapp/SecondBlogPage/Models/paragraphblog.dart';
import 'package:blogapp/SecondBlogPage/Models/videoblog.dart';

import 'package:flutter/material.dart';
class ThirdBlog {
  final List<ThirdBlogSpan> content; // Change this to List<ThirdBlogSpan>
  final String url;
  bool _isFetchingImage = false;

  ThirdBlog({required this.content, required this.url});

  TextSpan get concatenatedContent {
    return TextSpan(
      children: convertedContent,
      style: TextStyle(
        color: Colors.black, // Set the text color to black
      ),
    );
  }

  // Add a method to check if the image is fetching
  bool get isFetchingImage => _isFetchingImage;

  // Add a method to set the image fetching state
  void setFetchingImage(bool value) {
    _isFetchingImage = value;
  }

  List<TextSpan> get convertedContent {
    return content
        .map((span) => TextSpan(
              text: span.text,
              style: span.style,
            ))
        .toList();
  }

  factory ThirdBlog.fromJson(Map<String, dynamic> json) {
    final type = json['type'] as String;
    if (type == 'paragraph') {
      return ThirdParagraphBlock.fromJson(json);
    } else if (type == 'image') {
      return ThirdImageBlock.fromJson(json);
    } else if (type == 'link') {
      return ThirdLinkBlock.fromJson(json);
    } else if (type == 'heading_3') {
      return ThirdHeadingBlock.fromJson(json);
    } else if (type == 'video') {
      return ThirdVideoBlock.fromJson(json);
    }
    throw Exception('Unknown block type: $type');
  }
}