import 'package:blogapp/CustomFields/customtext.dart';
import 'package:blogapp/FirstBlogPage/View/second.dart';
import 'package:blogapp/Homepage/Models/blog.dart';
import 'package:blogapp/Homepage/Models/imageblock.dart';
import 'package:blogapp/Homepage/Provider/provider.dart';
import 'package:blogapp/SecondBlogPage/View/third.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class BlogListView extends StatefulWidget {
  @override
  _BlogListViewState createState() => _BlogListViewState();
}

class _BlogListViewState extends State<BlogListView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<BlogListProvider>(context, listen: false).fetchData();
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

  bool isVideoURL(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null || uri.pathSegments.isEmpty) return false;

    final String extension = uri.pathSegments.last.toLowerCase();
    return extension == 'mp4' || extension == 'avi' || extension == 'mov';
  }

  Widget buildMediaWidget(Blog blog) {
    if (blog is ImageBlock) {
      // Check if the blog is an ImageBlock
      // Return a FutureBuilder for image fetching
      return FutureBuilder(
        future: blog.fetchImage(),
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
            // Image fetched successfully, display the image
            return Image.network(blog.url);
          }
        },
      );
    } else if (isVideoURL(blog.url)) {
      // Return a FutureBuilder for video fetching
      final videoPlayerController =
          VideoPlayerController.networkUrl(blog.url as Uri);
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

      return Chewie(controller: chewieController);
    } else {
      // Handle other types of media if needed, or return an empty container.
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          height: MediaQuery.of(context).size.width * 0.1,
          width: MediaQuery.of(context).size.width * 0.2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          child: Icon(
            Icons.format_bold_outlined,
            color: Colors.white,
            size: 24,
          ),
        ),
        actions: [
          Container(
            height: MediaQuery.of(context).size.width * 0.1,
            width: MediaQuery.of(context).size.width * 0.6,
            //  color: Colors.red,
            child: TextField(
                onChanged: (value) =>
                    Provider.of<BlogListProvider>(context, listen: false)
                        .filterBlogs(value),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.search_sharp,
                    color: Colors.black,
                    size: 28,
                  ),
                )),
          ),
        ],
      ),
      body: Container(
        child: Consumer<BlogListProvider>(
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
                          itemCount: provider.displayedBlogs.length,
                          itemBuilder: (context, index) {
                            final blog = provider.displayedBlogs[index];

                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1,
                                  horizontal:
                                      16), // Add padding around the ListTile
                              child: InkWell(
                                onTap: () {
                                  print(index);
                                  if (index == 1 ||
                                      index == 2 ||
                                      index == 3 ||
                                      index == 4 ||
                                      index == 5) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SecondSecondBlog()));
                                  } else if (index == 6 ||
                                      index == 7 ||
                                      index == 8 ||
                                      index == 9 ||
                                      index == 10 ||
                                      index == 11) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ThirdThirdBlog()));
                                  }
                                },
                                child: Column(
                                  children: [
                                    // blog.url.startsWith('https')?Image.network(blog.url):SizedBox(),
                                    buildMediaWidget(blog),
                                    // blog.content[0]
                                    RichText(
                                      text: blog.concatenatedContent,
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
    );
  }
}
