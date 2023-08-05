import 'package:blogapp/Common_Widgets/CustomText.dart';
import 'package:blogapp/FirstBlogPage/Models/blog.dart';
import 'package:blogapp/FirstBlogPage/Models/imageblog.dart';
import 'package:blogapp/FirstBlogPage/Provider/provider.dart';
import 'package:blogapp/Homepage/Image/image.dart';
import 'package:blogapp/Homepage/Provider/provider.dart';
import 'package:blogapp/Homepage/View/homepage.dart';
import 'package:blogapp/NativeShare/share.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class SecondSecondBlog extends StatefulWidget {
  const SecondSecondBlog({super.key});

  @override
  State<SecondSecondBlog> createState() => _SecondSecondBlogState();
}

class _SecondSecondBlogState extends State<SecondSecondBlog> {
  String? shareul;
  final blogListView = BlogListView();

  List ImageJson = [
    {
      "image": "assets/image.png",
    },
    {
      "image": "assets/imageone.png",
    },
    {
      "image": "assets/imagetwo.png",
    },
    {"image": "assets/imagethree.png"}
  ];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<SecondBlogSecondListProvider>(context, listen: false)
          .fetchData();
    });
  }

  bool isImageURL(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null || uri.pathSegments.isEmpty) return false;

    final String extension = uri.pathSegments.last.toLowerCase();
    return extension == 'jpg' ||
        extension == 'jpeg' ||
        extension == 'png' ||
        extension == 'gif';
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BlogListView()));
            },
            child: Container(
              height: MediaQuery.of(context).size.width * 0.1,
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/back.png"))),
            )),
      ),
      body: Container(
        child: Consumer<SecondBlogSecondListProvider>(
          builder: (context, provider, _) {
            return Column(
              children: [
                provider.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: provider.displayedSecondBlogs.length,
                          itemBuilder: (context, index) {
                            final SecondBlog =
                                provider.displayedSecondBlogs[index];

                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1,
                                  horizontal:
                                      16), // Add padding around the ListTile
                              child: InkWell(
                                onTap: () {
                                  print(index);
                                },
                                child: Column(
                                  children: [
                                    buildMediaWidget(SecondBlog),
                                    RichText(
                                      text: SecondBlog.concatenatedContent,
                                      textAlign: TextAlign.start,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ],
            );
          },
        ),
      ),
      bottomSheet: Container(
        height: 220,
        //  color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Recommended",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: ImageJson.length,
                itemBuilder: (context, index) {
                  final imageInfo = ImageJson[index];
                  return Container(
                    width: 200,
                    height: 100,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imageInfo['image']),
                        fit: BoxFit.fill,
                      ),
                    ),
                  
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

//imageeeeeee or video

  bool isVideoURL(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null || uri.pathSegments.isEmpty) return false;

    final String extension = uri.pathSegments.last.toLowerCase();
    return extension == 'mp4' || extension == 'avi' || extension == 'mov';
  }

  Widget buildMediaWidget(SecondBlog SecondBlog) {
    if (SecondBlog is SecondImageBlock) {
      // Check if the SecondBlog is an SecondImageBlock
      // Return a FutureBuilder for image fetching
      return FutureBuilder(
        future: SecondBlog.fetchImage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While waiting for image to load, display a placeholder
            return CircularProgressIndicator(
              color: Colors.black,
            );
          } else if (snapshot.hasError) {
            // If there's an error, display an error message
            return Text('Error loading image');
          } else {
            // Image fetched successfully, display the image with the share icon

            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                      height: 200,
                      width: double.infinity,
                      child: Image.network(SecondBlog.url)),
                ),
                IconButton(
                  icon: Icon(
                    Icons.share_sharp,
                    size: 20,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Provider.of<share>(context, listen: false)
                        .Nativeshare(shareurl: SecondBlog.url);
                  },
                ),
              ],
            );
          }
        },
      );
    } else if (isVideoURL(SecondBlog.url)) {
      // Return a FutureBuilder for video fetching
      final videoPlayerController =
          VideoPlayerController.networkUrl(SecondBlog.url as Uri);
      final chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: false,
        aspectRatio: 16 / 9,
        autoInitialize: true,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(errorMessage),
          );
        },
      );

      // Show the video with the share icon
      return Stack(
        alignment: Alignment.topRight,
        children: [
          Chewie(controller: chewieController),
          IconButton(
            icon: Icon(
              Icons.share,
              size: 20,
              color: Colors.black,
            ),
            onPressed: () {
              Provider.of<share>(context, listen: false)
                  .Nativeshare(shareurl: SecondBlog.url);
            },
          ),
        ],
      );
    } else {
      // Handle other types of media if needed, or return an empty container.
      return Container();
    }
  }
}
