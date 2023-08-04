import 'package:blogapp/FirstBlogPage/Api/api.dart';
import 'package:blogapp/FirstBlogPage/Models/blog.dart';
import 'package:flutter/material.dart';


class SecondBlogSecondListProvider extends ChangeNotifier {
  final SecondApiService apiService = SecondApiService();
  List<SecondBlog> _allSecondBlogs = [];
  List<SecondBlog> _displayedSecondBlogs = [];

  List<SecondBlog> get displayedSecondBlogs => _displayedSecondBlogs;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    try {
      List<SecondBlog> SecondBlogs = await apiService.fetchData();
      _allSecondBlogs = SecondBlogs;
      _displayedSecondBlogs = SecondBlogs;
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
}
