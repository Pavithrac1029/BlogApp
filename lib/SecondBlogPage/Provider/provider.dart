import 'package:blogapp/FirstBlogPage/Api/api.dart';
import 'package:blogapp/FirstBlogPage/Models/blog.dart';
import 'package:blogapp/SecondBlogPage/Api/api.dart';
import 'package:blogapp/SecondBlogPage/Models/blog.dart';
import 'package:flutter/material.dart';


class ThirdBlogThirdListProvider extends ChangeNotifier {
  final ThirdApiService apiService = ThirdApiService();
  List<ThirdBlog> _allThirdBlogs = [];
  List<ThirdBlog> _displayedThirdBlogs = [];

  List<ThirdBlog> get displayedThirdBlogs => _displayedThirdBlogs;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    try {
      List<ThirdBlog> ThirdBlogs = await apiService.fetchData();
      _allThirdBlogs = ThirdBlogs;
      _displayedThirdBlogs = ThirdBlogs;
      _isLoading = false;

      // Schedule notifyListeners after a short delay (e.g., 100 milliThirds)
      Future.delayed(Duration(milliseconds: 100), () {
        notifyListeners();
      });
    } catch (e) {
      _isLoading = false;

      // Schedule notifyListeners after a short delay (e.g., 100 milliThirds)
      Future.delayed(Duration(milliseconds: 100), () {
        notifyListeners();
      });

      print('Error fetching data: $e');
      // Handle error
    }
  }
}
