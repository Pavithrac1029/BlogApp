import 'package:blogapp/FirstBlogPage/Models/blog.dart';
import 'package:blogapp/FirstBlogPage/Models/blogspan.dart';
import 'package:blogapp/SecondBlogPage/Models/blog.dart';
import 'package:blogapp/SecondBlogPage/Models/blogspan.dart';
import 'package:http/http.dart' as http;

class ThirdImageBlock extends ThirdBlog {
  ThirdImageBlock({required List<ThirdBlogSpan> content, required String url})
      : super(content: content, url: url);

  bool _isFetchingImage = false; // Define the variable here

  // Add a getter method for _isFetchingImage
  bool get isFetchingImage => _isFetchingImage;

  // Add a setter method for _isFetchingImage
  void setFetchingImage(bool value) {
    _isFetchingImage = value;
  }

  factory ThirdImageBlock.fromJson(Map<String, dynamic> json) {
    final imageUrl = json['image']?['file']?['url'] ?? ''; // Modify this line
    return ThirdImageBlock(content: [], url: imageUrl); // Modify this line
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
