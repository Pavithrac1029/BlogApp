import 'package:blogapp/Homepage/Models/blogspan.dart';
import 'package:blogapp/Homepage/Models/imageblock.dart';
import 'package:blogapp/Homepage/Models/paragraphblock.dart';
import 'package:flutter/material.dart';
class Blog {
  final List<BlogSpan> content; // Change this to List<BlogSpan>
  final String url;
  bool _isFetchingImage = false;

  Blog({required this.content, required this.url});

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

  factory Blog.fromJson(Map<String, dynamic> json) {
    if (json['type'] == 'paragraph') {
      return ParagraphBlock.fromJson(json);
    } else if (json['type'] == 'image') {
      return ImageBlock.fromJson(json);
    }
    throw Exception('Unknown block type');
  }
}