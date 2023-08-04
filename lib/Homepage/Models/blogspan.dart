import 'package:flutter/material.dart';

class BlogSpan {
  final String text;
  final TextStyle style;

  BlogSpan({required this.text, required this.style});
  String toPlainText() {
    return text;
  }
}
