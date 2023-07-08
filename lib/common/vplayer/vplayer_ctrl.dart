import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'vplayer_provider.dart';


// class VideoPlayerWidget extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final videoController = ref.watch(videoPlayerProvider);

//     return AspectRatio(
//       aspectRatio: videoController.value.aspectRatio,
//       child: VideoPlayer(videoController),
//     );
//   }
// }



class VideoPlayerWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoController = ref.watch(videoPlayerControllerProvider);
    final videoControllerNotifier = ref.watch(videoPlayerControllerProvider);

    return AspectRatio(
      aspectRatio: videoController.value.aspectRatio,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          VideoPlayer(videoController),
          VideoProgressIndicator(
            videoController,
            allowScrubbing: true,
            padding: EdgeInsets.all(8.0),
          ),
          IconButton(
            icon: Icon(
              videoController.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
            onPressed: () {
              if (videoController.value.isPlaying) {
                videoControllerNotifier.pause();
              } else {
                videoControllerNotifier.play();
              }
            },
          ),
        ],
      ),
    );
  }
}
