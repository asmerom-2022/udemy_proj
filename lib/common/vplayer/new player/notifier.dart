import 'dart:developer';

import 'package:video_player/video_player.dart';
import 'package:riverpod/riverpod.dart';

class VideoPlayerControllerNotifier
    extends AutoDisposeAsyncNotifier<VideoPlayerController?> {
      
  @override
  build() {
    ref.onDispose(() {
      state.asData?.value!.dispose();
    });
    return initialize();
  }

  var videoUrl =
     'https://firebasestorage.googleapis.com/v0/b/udemy-proj-2c8cc.appspot.com/o/images%2Fshoes_ads.mp4?alt=media&token=e4c2db41-6f2e-47bb-ba19-bc87464a6634';
  // 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';

  Future<VideoPlayerController> initialize() async {
    final controller = VideoPlayerController.network(videoUrl);
    log('video url is $videoUrl');
    await controller.initialize();
    controller.value.isInitialized ? controller.play() : controller.pause();
    return controller;
  }
}
