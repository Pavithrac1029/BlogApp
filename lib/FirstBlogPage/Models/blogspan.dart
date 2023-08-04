import 'package:flutter/material.dart';

class SecondBlogSpan {
  final String text;
  final TextStyle style;

  SecondBlogSpan({required this.text, required this.style});
  String toPlainText() {
    return text;
  }
}