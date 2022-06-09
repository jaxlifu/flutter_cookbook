import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ExampleImageLoader extends StatefulWidget {
  const ExampleImageLoader({Key? key}) : super(key: key);

  @override
  State<ExampleImageLoader> createState() => _ExampleImageLoaderState();
}

class _ExampleImageLoaderState extends State<ExampleImageLoader> {
  final imageUrl =
      'https://i2.chuimg.com/bef322788b6711e6b87c0242ac110003_1440w_1080h.jpg?imageView2/2/w/660/interlace/1/q/90';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildContent(),
    );
  }

  _buildAppBar() => AppBar();

  _buildContent() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            const Center(child: CircularProgressIndicator()),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: imageUrl,
                    ),
                    _buildSeparator(),
                    FadeInImage.assetNetwork(
                      image: imageUrl,
                      placeholder: 'images/loading.gif',
                    ),
                    _buildSeparator(),
                    CachedNetworkImage(
                      imageUrl: imageUrl,
                      placeholder: (context, url) =>
                          Image.asset('images/loading.gif'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildSeparator() => const SizedBox(height: 8);
}
