import 'package:flutter/material.dart';
import 'package:udemy_prac/common/vplayer/vplayer_ctrl.dart';


class vplayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Video Player'),
        ),
        body: Center(
          child: VideoPlayerWidget(),
        ),
      ),
    );
  }
}
