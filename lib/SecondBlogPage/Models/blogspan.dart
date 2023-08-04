import 'package:flutter/material.dart';

class ThirdBlogSpan {
  final String text;
  final TextStyle style;

  ThirdBlogSpan({required this.text, required this.style});
  String toPlainText() {
    return text;
  }
}