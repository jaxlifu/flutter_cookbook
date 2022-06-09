import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ExamplePlayVideo extends StatefulWidget {
  const ExamplePlayVideo({Key? key}) : super(key: key);

  @override
  State<ExamplePlayVideo> createState() => _ExamplePlayVideoState();
}

class _ExamplePlayVideoState extends State<ExamplePlayVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _isMobile
          ? const MobileVideoPlayerScreen()
          : const DesktopVideoPlayerScreen(),
    );
  }

  bool get _isMobile => kIsWeb || Platform.isAndroid || Platform.isIOS;

  bool get _isDesktop =>
      Platform.isWindows || Platform.isLinux || Platform.isMacOS;
}

class MobileVideoPlayerScreen extends StatefulWidget {
  const MobileVideoPlayerScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MobileVideoPlayerScreen> createState() =>
      _MobileVideoPlayerScreenState();
}

class _MobileVideoPlayerScreenState extends State<MobileVideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    _controller.setLooping(true);
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return IntrinsicHeight(
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            _controller.play();
                          }
                        });
                      },
                      child: Icon(_controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow),
                    ),
                  )
                ],
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

class DesktopVideoPlayerScreen extends StatefulWidget {
  const DesktopVideoPlayerScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DesktopVideoPlayerScreen> createState() =>
      _DesktopVideoPlayerScreenState();
}

class _DesktopVideoPlayerScreenState extends State<DesktopVideoPlayerScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
