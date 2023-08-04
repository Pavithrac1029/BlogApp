import 'package:blogapp/FirstBlogPage/Models/blog.dart';
import 'package:blogapp/FirstBlogPage/Models/imageblog.dart';
import 'package:blogapp/FirstBlogPage/Provider/provider.dart';
import 'package:blogapp/Homepage/View/homepage.dart';
import 'package:blogapp/NativeShare/share.dart';
import 'package:blogapp/SecondBlogPage/Models/blog.dart';
import 'package:blogapp/SecondBlogPage/Models/imageblog.dart';
import 'package:blogapp/SecondBlogPage/Provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class ThirdThirdBlog extends StatefulWidget {
  const ThirdThirdBlog({super.key});

  @override
  State<ThirdThirdBlog> createState() => _ThirdThirdBlogState();
}

class _ThirdThirdBlogState extends State<ThirdThirdBlog> {
  String? shareul;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<ThirdBlogThirdListProvider>(context, listen: false)
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

  bool isVideoURL(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null || uri.pathSegments.isEmpty) return false;

    final String extension = uri.pathSegments.last.toLowerCase();
    return extension == 'mp4' || extension == 'avi' || extension == 'mov';
  }

  Widget buildMediaWidget(ThirdBlog ThirdBlog) {
    if (ThirdBlog is ThirdImageBlock) {
      // Check if the ThirdBlog is an ThirdImageBlock
      // Return a FutureBuilder for image fetching
      return FutureBuilder(
        future: ThirdBlog.fetchImage(),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.network(ThirdBlog.url),
                ),
                IconButton(
                  icon: Icon(
                    Icons.share_sharp,
                    size: 20,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Provider.of<share>(context, listen: false)
                        .Nativeshare(shareurl: ThirdBlog.url);
                  },
                ),
              ],
            );
          }
        },
      );
    } else if (isVideoURL(ThirdBlog.url)) {
      // Return a FutureBuilder for video fetching
      final videoPlayerController =
          VideoPlayerController.networkUrl(ThirdBlog.url as Uri);
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
                        .Nativeshare(shareurl: ThirdBlog.url);
            },
          ),
        ],
      );
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
        leading: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BlogListView()));
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 24,
          ),
        ),
      ),
      body: Container(
        child: Consumer<ThirdBlogThirdListProvider>(
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
                          itemCount: provider.displayedThirdBlogs.length,
                          itemBuilder: (context, index) {
                            final ThirdBlog =
                                provider.displayedThirdBlogs[index];

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
                                    // ThirdBlog.url.startsWith('https')?Image.network(ThirdBlog.url):SizedBox(),
                                    buildMediaWidget(ThirdBlog),
                                    // ThirdBlog.content[0]
                                    RichText(
                                      text: ThirdBlog.concatenatedContent,
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
