import 'package:video_player/video_player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final videoPlayerProvider = Provider.autoDispose<VideoPlayerController>((ref) {
//   return VideoPlayerController.network('https://firebasestorage.googleapis.com/v0/b/udemy-proj-2c8cc.appspot.com/o/images%2Fshoes_ads.mp4?alt=media&token=e4c2db41-6f2e-47bb-ba19-bc87464a6634');
// });


final videoPlayerControllerProvider =
    Provider.autoDispose<VideoPlayerController>((ref) {
  return VideoPlayerController.network('YOUR_VIDEO_URL');
});

class VideoPlayerControllerNotifier extends StateNotifier<VideoPlayerController> {
  VideoPlayerControllerNotifier(this._videoPlayerController)
      : super(_videoPlayerController);

  final VideoPlayerController _videoPlayerController;

  void play() {
    _videoPlayerController.play();
  }

  void pause() {
    _videoPlayerController.pause();
  }

  void seekTo(Duration position) {
    _videoPlayerController.seekTo(position);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
