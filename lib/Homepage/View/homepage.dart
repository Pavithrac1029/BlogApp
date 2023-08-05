import 'package:blogapp/CustomFields/customtext.dart';
import 'package:blogapp/FirstBlogPage/View/second.dart';
import 'package:blogapp/Homepage/Image/image.dart';
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
              image: DecorationImage(image: AssetImage("assets/logo.png"))),
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
                    suffixIcon: Container(
                      height: MediaQuery.of(context).size.width * 0.1,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/search.png"))),
                    ))),
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
                                    // buildMediaWidget(blog),

                                    MediaWidget(context: context, media: blog),
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

// class ParentWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => BlogListProvider(),
//       child: SecondSecondBlog(),
//     );
//   }
// }
