import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cookbook/main.dart';
import 'package:flutter/material.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    Key? key,
    // required this.camera,
  }) : super(key: key);
  // final CameraDescription camera;
  @override
  State<TakePictureScreen> createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {
  late final Future<void> _initializeControllerFuture;
  late final CameraController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      cameras.first,
      ResolutionPreset.max,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: FutureBuilder(
            future: _initializeControllerFuture,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: InkWell(
            onTap: () async {
              try {
                await _initializeControllerFuture;
                final image = await _controller.takePicture();
                if (!mounted) {
                  return;
                }
                await Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => DisplayPictureScreen(
                            imagePath: image.path,
                          )),
                );
              } catch (e) {
                debugPrint(e.toString());
              }
            },
            child: const Icon(Icons.camera),
          ),
        ),
      ],
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  const DisplayPictureScreen({
    Key? key,
    required this.imagePath,
  }) : super(key: key);
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Image.file(File(imagePath)),
    );
  }
}
