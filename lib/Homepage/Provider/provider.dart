import 'package:blogapp/Homepage/Api/api.dart';
import 'package:blogapp/Homepage/Models/blog.dart';
import 'package:flutter/material.dart';


class BlogListProvider extends ChangeNotifier {
  final ApiService apiService = ApiService();
  List<Blog> _allBlogs = [];
  List<Blog> _displayedBlogs = [];

  List<Blog> get displayedBlogs => _displayedBlogs;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    try {
      List<Blog> blogs = await apiService.fetchData();
      _allBlogs = blogs;
      _displayedBlogs = blogs;
      _isLoading = false;

      // Schedule notifyListeners after a short delay (e.g., 100 milliseconds)
      Future.delayed(Duration(milliseconds: 100), () {
        notifyListeners();
      });
    } catch (e) {
      _isLoading = false;

      // Schedule notifyListeners after a short delay (e.g., 100 milliseconds)
      Future.delayed(Duration(milliseconds: 100), () {
        notifyListeners();
      });

      print('Error fetching data: $e');
      // Handle error
    }
  }

  void filterBlogs(String? searchText) {
    if (searchText != null && searchText.isNotEmpty) {
      _displayedBlogs = _allBlogs
          .where((blog) => blog.content.any((textSpan) => textSpan
              .toPlainText()
              .toLowerCase()
              .contains(searchText.toLowerCase())))
          .toList();
    } else {
      _displayedBlogs = _allBlogs;
    }
    notifyListeners();
  }
}