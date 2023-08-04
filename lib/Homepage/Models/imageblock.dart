import 'package:blogapp/Homepage/Models/blog.dart';
import 'package:blogapp/Homepage/Models/blogspan.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ImageBlock extends Blog {
  ImageBlock({required List<BlogSpan> content, required String url})
      : super(content: content, url: url);

  bool _isFetchingImage = false; // Define the variable here

  // Add a getter method for _isFetchingImage
  bool get isFetchingImage => _isFetchingImage;

  // Add a setter method for _isFetchingImage
  void setFetchingImage(bool value) {
    _isFetchingImage = value;
  }

  factory ImageBlock.fromJson(Map<String, dynamic> json) {
    final url = json['image']?['file']?['url'] ?? '';
    return ImageBlock(content: [], url: url);
  }
  // Add a method to fetch the image
  Future<void> fetchImage() async {
    if (url.isNotEmpty && !_isFetchingImage) {
      setFetchingImage(true);
      // Fetch the image here using the url
      // You can use http package or any other image loading library
      try {
        // For example, using http package
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          // Image fetched successfully
          // Handle the image data here
        }
      } catch (e) {
        // Error fetching image
      }
      setFetchingImage(false);
    }
  }
}
