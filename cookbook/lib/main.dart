import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cookbook/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras = List.empty();

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
    try {
      cameras = await availableCameras();
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
  runApp(const App());
}
