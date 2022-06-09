import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class ExampleStaggeredAnimations extends StatefulWidget {
  const ExampleStaggeredAnimations({
    Key? key,
  }) : super(key: key);

  @override
  State<ExampleStaggeredAnimations> createState() =>
      _ExampleStaggeredAnimationsState();
}

class _ExampleStaggeredAnimationsState extends State<ExampleStaggeredAnimations>
    with SingleTickerProviderStateMixin {
  late AnimationController _drawerSlideController;

  @override
  void initState() {
    super.initState();
    _drawerSlideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
  }

  @override
  void dispose() {
    _drawerSlideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          _buildContent(),
          _buildDrawer(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() => AppBar(
        actions: [
          AnimatedBuilder(
            animation: _drawerSlideController,
            builder: (context, child) {
              final iconData = _isDrawerOpen() || _isDrawerOpening()
                  ? Icons.clear
                  : Icons.menu;
              return IconButton(
                onPressed: _toggleDrawer,
                icon: Icon(iconData),
              );
            },
          ),
        ],
      );

  Widget _buildDrawer() => AnimatedBuilder(
        animation: _drawerSlideController,
        builder: (BuildContext context, Widget? child) {
          return FractionalTranslation(
            translation: Offset(1.0 - _drawerSlideController.value, 0.0),
            child: _isDrawerClosed() ? const SizedBox() : const Menu(),
          );
        },
      );

  Widget _buildContent() => const SizedBox();

  bool _isDrawerOpen() => _drawerSlideController.value == 1.0;

  bool _isDrawerClosed() => _drawerSlideController.value == 0.0;

  bool _isDrawerOpening() =>
      _drawerSlideController.status == AnimationStatus.forward;

  void _toggleDrawer() {
    if (_isDrawerOpen() || _isDrawerOpening()) {
      _drawerSlideController.reverse();
    } else {
      _drawerSlideController.forward();
    }
  }
}

class Menu extends StatefulWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  static const _menuTitles = [
    'Declarative Style',
    'Premade Widgets',
    'Stateful Hot Reload',
    'Native Performance',
    'Great Community',
  ];
  static const _initialDelayTime = Duration(milliseconds: 50);
  static const _itemSlideTime = Duration(milliseconds: 250);
  static const _staggerTime = Duration(milliseconds: 50);
  static const _buttonDelayTime = Duration(milliseconds: 150);
  static const _buttonTime = Duration(milliseconds: 500);
  final _animationDuration = _initialDelayTime +
      (_staggerTime * _menuTitles.length) +
      _buttonDelayTime +
      _buttonTime;

  late List<Interval> _itemSlideIntervals;
  late Interval _buttonInterval;
  late AnimationController _staggeredController;

  @override
  void initState() {
    super.initState();

    _createAnimationIntervals();
    _staggeredController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..forward();
  }

  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildFlutterLogo(),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildFlutterLogo() => const Positioned(
        child: Opacity(
          opacity: 0.2,
          child: FlutterLogo(size: 400),
        ),
      );

  Widget _buildContent() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          ..._buildListItems(),
          const Spacer(),
          _buildGetStartedButton(),
        ],
      );

  List<Widget> _buildListItems() => _menuTitles
      .mapIndexed(
        (index, item) => AnimatedBuilder(
          animation: _staggeredController,
          builder: (BuildContext context, Widget? child) {
            final animationPercent = Curves.easeOut.transform(
              _itemSlideIntervals[index].transform(_staggeredController.value),
            );
            final opacity = animationPercent;
            final slideDistance = (1.0 - animationPercent) * 150;
            return Opacity(
              opacity: opacity,
              child: Transform.translate(
                offset: Offset(slideDistance, 0),
                child: child,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 36,
              vertical: 16,
            ),
            child: Text(
              item,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      )
      .toList();

  Widget _buildGetStartedButton() => SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: AnimatedBuilder(
            animation: _staggeredController,
            builder: (context, child) {
              final animationPercent = Curves.elasticOut.transform(
                _buttonInterval.transform(_staggeredController.value),
              );
              final opacity = animationPercent.clamp(0.0, 1.0);
              final scale = (animationPercent * 0.5) + 0.5;
              return Opacity(
                opacity: opacity,
                child: Transform.scale(
                  scale: scale,
                  child: child,
                ),
              );
            },
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                primary: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 48,
                  vertical: 14,
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ),
      );

  void _createAnimationIntervals() {
    _itemSlideIntervals = _menuTitles.mapIndexed(
      (index, _) {
        final startTime = _initialDelayTime + (_staggerTime * index);
        final endTime = startTime + _itemSlideTime;
        return Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds,
        );
      },
    ).toList();

    final buttonStartTime =
        Duration(milliseconds: (_menuTitles.length * 50)) + _buttonDelayTime;
    final buttonEndTime = buttonStartTime + _buttonDelayTime;
    _buttonInterval = Interval(
      buttonStartTime.inMilliseconds / _animationDuration.inMilliseconds,
      buttonEndTime.inMilliseconds / _animationDuration.inMilliseconds,
    );
  }
}
