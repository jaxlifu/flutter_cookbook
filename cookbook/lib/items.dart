import 'package:cookbook/example/basic_list.dart';
import 'package:cookbook/example/drag_and_drop.dart';
import 'package:cookbook/example/expandable_fab.dart';
import 'package:cookbook/example/gestures.dart';
import 'package:cookbook/example/gradient_bubbles.dart';
import 'package:cookbook/example/hero_animations.dart';
import 'package:cookbook/example/image_loader.dart';
import 'package:cookbook/example/layout_constraints.dart';
import 'package:cookbook/example/mixed_list.dart';
import 'package:cookbook/example/navigation_basics.dart';
import 'package:cookbook/example/network.dart';
import 'package:cookbook/example/passing_data.dart';
import 'package:cookbook/example/persistence_key_values.dart';
import 'package:cookbook/example/persistence_sqlite.dart';
import 'package:cookbook/example/picture_using_camera.dart';
import 'package:cookbook/example/player_video.dart';
import 'package:cookbook/example/post_data.dart';
import 'package:cookbook/example/read_write_files.dart';
import 'package:cookbook/example/staggered_animation.dart';
import 'package:cookbook/example/typing_indicator.dart';
import 'package:cookbook/example/ui_loading_animation.dart';
import 'package:cookbook/example/validation.dart';
import 'package:cookbook/example/web_sockets.dart';
import 'package:flutter/material.dart';

final items = <CookbookItem>[
  CookbookItem(
    'ExampleLayoutContraints',
    'Contraints',
    Recommendation.maybe,
    (_) => const ExampleLayoutContraints(),
  ),
  CookbookItem(
    'ExampleCamera',
    'camera',
    Recommendation.yes,
    (_) => const TakePictureScreen(),
  ),
  CookbookItem(
    'ExamplePlayVideo',
    'video',
    Recommendation.yes,
    (_) => const ExamplePlayVideo(),
  ),
  CookbookItem(
    'ExampleSharedPreferences',
    'SharedPreferences',
    Recommendation.yes,
    (_) => const ExampleSharedPreferences(),
  ),
  CookbookItem(
    'ReadWriteFiles',
    'Files',
    Recommendation.yes,
    (_) => ReadWriteFiles(),
  ),
  CookbookItem(
    'ExamplePersistenceSqlite',
    'Sqlite',
    Recommendation.yes,
    (_) => const ExamplePersistenceSqlite(),
  ),
  CookbookItem(
    'ExampleWebSockets',
    'Network',
    Recommendation.yes,
    (_) => const ExampleWebSockets(),
  ),
  CookbookItem(
    'ExamplePostData',
    'Network',
    Recommendation.yes,
    (_) => const ExamplePostData(),
  ),
  CookbookItem(
    'ExampleNetwork',
    'Network',
    Recommendation.yes,
    (_) => const ExampleNetwork(),
  ),
  CookbookItem(
    'Parallax Scrolling',
    'Scrolling',
    Recommendation.yes,
    (_) => const Scaffold(),
  ),
  CookbookItem(
    'Gradient Bubbles',
    'Transition',
    Recommendation.yes,
    (_) => const ExampleGradientBubbles(),
  ),
  CookbookItem(
    'Download Button',
    'Button',
    Recommendation.yes,
    (_) => const Scaffold(),
  ),
  CookbookItem(
    'Instagram Camera Buttons',
    'Button',
    Recommendation.yes,
    (_) => const Scaffold(),
  ),
  CookbookItem(
    'Order Food Draggable',
    'UI Pattern',
    Recommendation.yes,
    (_) => const ExampleDragAndDrop(),
  ),
  CookbookItem(
    'Expandable FAB',
    'Button',
    Recommendation.yes,
    (_) => const ExampleExpandableFab(),
  ),
  CookbookItem(
    'Staggered Animation',
    'Transition',
    Recommendation.yes,
    (_) => const ExampleStaggeredAnimations(),
  ),
  CookbookItem(
    'Is Typing Animation',
    'Animation',
    Recommendation.yes,
    (_) => const ExampleIsTyping(),
  ),
  CookbookItem(
    'UI Loading Animations',
    'Utility',
    Recommendation.maybe,
    (_) => const ExampleUiLoadingAnimation(),
  ),
  CookbookItem(
    'Validate Form',
    'forms',
    Recommendation.maybe,
    (_) => const MyCustomForm(),
  ),
  CookbookItem(
    'Validate Form',
    'gestures',
    Recommendation.maybe,
    (_) => const Ripples(),
  ),
  CookbookItem(
    'ImageLoader',
    'Image',
    Recommendation.maybe,
    (_) => const ExampleImageLoader(),
  ),
  CookbookItem(
    'BasicList',
    'ListView',
    Recommendation.maybe,
    (_) => const BasicList(),
  ),
  CookbookItem(
    'MixedList',
    'ListView',
    Recommendation.maybe,
    (_) => const MixedList(),
  ),
  CookbookItem(
    'HeroAnimations',
    'navigation',
    Recommendation.maybe,
    (_) => const ExampleHeroAnimations(),
  ),
  CookbookItem(
    'ExampleNavigationBasics',
    'navigation',
    Recommendation.maybe,
    (_) => const ExampleNavigationBasics(),
  ),
  CookbookItem(
    'TodosScreen',
    'navigation',
    Recommendation.maybe,
    (_) => const TodosScreen(),
  ),
];

class CookbookItem {
  CookbookItem(
    this.name,
    this.type,
    this.recommendation,
    this.builder,
  );

  final String name;
  final String type;
  final Recommendation recommendation;
  final WidgetBuilder builder;
}

enum Recommendation {
  yes,
  maybe,
  no,
}
