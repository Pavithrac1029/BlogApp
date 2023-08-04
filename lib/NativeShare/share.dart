import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:share/share.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path/path.dart';

class share extends ChangeNotifier {
  Future<void> Nativeshare({shareurl}) async {
    // Replace this URL with the actual image URL you want to share
    String imageUrl = shareurl;
    print("shareurlll :$shareurl");
   

    try {
      // Download the image from the URL
      Response response = await http.get(Uri.parse(imageUrl));
      List<int> imageBytes = response.bodyBytes;

      // Get the temporary directory of the device to store the downloaded image
      Directory tempDir = await getTemporaryDirectory();
      String imageFileName = basename(imageUrl.split('?').first);
      String imagePath = '${tempDir.path}/$imageFileName';

      // Save the image to the temporary directory
      File imageFile = File(imagePath);
      await imageFile.writeAsBytes(imageBytes);

      // Share the downloaded image
      Share.shareFiles([imagePath], text: '');
      notifyListeners();
    } catch (e) {
      print('Error downloading or sharing image: $e');
      notifyListeners();
    }
    notifyListeners();
  }
}
