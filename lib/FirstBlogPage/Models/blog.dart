import 'package:blogapp/FirstBlogPage/Models/blogspan.dart';
import 'package:blogapp/FirstBlogPage/Models/headingblock.dart';
import 'package:blogapp/FirstBlogPage/Models/imageblog.dart';
import 'package:blogapp/FirstBlogPage/Models/linkblock.dart';
import 'package:blogapp/FirstBlogPage/Models/paragraphblog.dart';
import 'package:blogapp/FirstBlogPage/Models/videoblog.dart';

import 'package:flutter/material.dart';
class SecondBlog {
  final List<SecondBlogSpan> content; // Change this to List<SecondBlogSpan>
  final String url;
  bool _isFetchingImage = false;

  SecondBlog({required this.content, required this.url});

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

  factory SecondBlog.fromJson(Map<String, dynamic> json) {
    final type = json['type'] as String;
    if (type == 'paragraph') {
      return SecondParagraphBlock.fromJson(json);
    } else if (type == 'image') {
      return SecondImageBlock.fromJson(json);
    } else if (type == 'link') {
      return SecondLinkBlock.fromJson(json);
    } else if (type == 'heading_3') {
      return SecondHeadingBlock.fromJson(json);
    } else if (type == 'video') {
      return SecondVideoBlock.fromJson(json);
    }
    throw Exception('Unknown block type: $type');
  }
}