import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cookbook/module/album.dart';
import 'package:cookbook/module/photo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> deleteAlbum(String id) async {
  final http.Response response = await http.delete(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to delete album');
  }
  debugPrint('result: ${response.body}');
  return Album.fromJson(jsonDecode(response.body));
}

Future<Album> fetchAlbum() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
  );

  if (response.statusCode != 200) {
    throw Exception('Fail to load album');
  }
  debugPrint('result: ${response.body}');
  return Album.fromJson(jsonDecode(response.body));
}

List<Photo> parsePhotos(String responseBody) {
  // final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  // return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  return (jsonDecode(responseBody) as List)
      .map((json) => Photo.fromJson(json))
      .toList();
}

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  if (response.statusCode != 200) {
    return List.empty();
  }
  return compute(parsePhotos, response.body);
}

Future<Album> createAlbum(String title) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      "title": title,
    }),
  );
  if ((response.statusCode ~/ 100) != 2) {
    throw Exception('createAlbum fail');
  }

  return Album.fromJson(jsonDecode(response.body));
}

class ExampleNetwork extends StatefulWidget {
  const ExampleNetwork({Key? key}) : super(key: key);

  @override
  State<ExampleNetwork> createState() => _ExampleNetworkState();
}

class _ExampleNetworkState extends State<ExampleNetwork> {
  late final Future<List<Photo>> _photos;
  late Future<Album> _album;
  late final TextEditingController _editingController;
  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController();
    _photos = fetchPhotos(http.Client());
    _album = fetchAlbum();
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildContent(),
    );
  }

  AppBar _buildAppBar() => AppBar();

  Widget _buildContent() => Center(
        child: Column(
          children: [
            _buildDeleteData(),
            const SizedBox(height: 32),
            _buildCreateData(),
            const SizedBox(height: 32),
            _buildImageList(),
          ],
        ),
      );

  FutureBuilder<List<Photo>> _buildImageList() {
    return FutureBuilder<List<Photo>>(
      future: _photos,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Expanded(child: PhotoList(photos: snapshot.data!));
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }

  FutureBuilder<Album> _buildDeleteData() {
    return FutureBuilder<Album>(
      future: _album,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(data?.title ?? "Deleted"),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _album = deleteAlbum(data!.id.toString());
                  });
                },
                child: const Text("Delete Data"),
              )
            ],
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }

  FutureBuilder _buildCreateData() => FutureBuilder<Album>(
        future: _album,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data?.id == null) {
            return SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _editingController,
                      autofocus: true,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _album = createAlbum(_editingController.text);
                          _album.then((value) => debugPrint(value.toJson().toString()));
                        });
                      },
                      child: const Text('Create'),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      );
}

class PhotoList extends StatelessWidget {
  const PhotoList({
    Key? key,
    required this.photos,
  }) : super(key: key);

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (BuildContext context, int index) {
        return CachedNetworkImage(
          imageUrl: photos[index].thumbnailUrl,
          placeholder: (_, __) => Image.asset(
            'images/loading.gif',
            fit: BoxFit.scaleDown,
          ),
        );
      },
    );
  }
}
