import 'package:blogapp/NativeShare/share.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../Models/imageblock.dart';

class MediaWidget extends StatelessWidget {
  final dynamic media;
  final BuildContext context;

  MediaWidget({required this.context, required this.media});

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

  Widget buildMediaWidget() {
    if (media is ImageBlock) {
      // Check if the media is an ImageBlock
      // Return a FutureBuilder for image fetching
      return FutureBuilder(
        future: media.fetchImage(),
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
                  child: Image.network(media.url),
                ),
              ],
            );
          }
        },
      );
    } else if (isVideoURL(media.url)) {
      // Return a FutureBuilder for video fetching
      final videoPlayerController = VideoPlayerController.networkUrl(media.url);
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
        ],
      );
    } else {
      // Handle other types of media if needed, or return an empty container.
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildMediaWidget();
  }
}
