import 'package:flutter/material.dart';

const imageTag = "imageHero";

class ExampleHeroAnimations extends StatefulWidget {
  const ExampleHeroAnimations({Key? key}) : super(key: key);

  @override
  State<ExampleHeroAnimations> createState() => _ExampleHeroAnimationsState();
}

class _ExampleHeroAnimationsState extends State<ExampleHeroAnimations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const DetailScreen();
          }));
        },
        child: Hero(
          tag: imageTag,
          child: Image.asset('images/loading.gif'),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: imageTag,
            child: Image.asset(
              'images/loading.gif',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
