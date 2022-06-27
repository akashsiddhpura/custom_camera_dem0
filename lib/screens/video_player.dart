import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  final String videoPath;
  const VideoPage({Key? key, required this.videoPath}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController? _videoPlayerController;

  bool isPlaying = true;

  set() {
    if (mounted) {
      setState(() {});
    }
  }
@override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  void dispose() {
    _videoPlayerController!.dispose();
    super.dispose();
  }



  Future _initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.file(File(widget.videoPath));
    await _videoPlayerController!.initialize();
    await _videoPlayerController!.setLooping(true);
    await _videoPlayerController!.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('video player'),

        backgroundColor: Colors.black87,

      ),
      // extendBodyBehindAppBar: true,
      body: FutureBuilder(
        future: _initVideoPlayer(),
        builder: (context, state) {
          if (state.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return VideoPlayer(_videoPlayerController!);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isPlaying) {
            isPlaying = false;
                // Navigator.
            _videoPlayerController!.pause();

          } else {
            isPlaying = true;

            // if (_controller.currentIndex != null) {
            _videoPlayerController!.play();

            // }
          }
        },
        child: Icon(
          isPlaying
              ? Icons.pause_circle_filled_outlined
              : Icons.play_circle_fill_outlined,
          size: 25,
          color: Colors.white70,
        ),
      ),
    );
  }
}
