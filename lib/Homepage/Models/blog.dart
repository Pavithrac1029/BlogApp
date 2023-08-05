import 'package:flutter/material.dart';
import 'package:blogapp/Homepage/Models/blogspan.dart';
import 'package:blogapp/Homepage/Models/imageblock.dart';
import 'package:blogapp/Homepage/Models/paragraphblock.dart';

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

  // Add a method to get the media information if available
  dynamic get media {
    if (this is ImageBlock) {
      return (this as ImageBlock).url;
    } else {
      return null; // Handle other cases if needed
    }
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
