import 'package:flutter/material.dart';

class MixedList extends StatefulWidget {
  const MixedList({Key? key}) : super(key: key);

  @override
  State<MixedList> createState() => _MixedListState();
}

class _MixedListState extends State<MixedList> {
  final _items = List<ListItem>.generate(
    1000,
    (index) => index % 6 == 0
        ? HeadingItem('heading $index')
        : MessageItem('Sender $index', 'Message body $index'),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _buildAppBar(),
      body: _buildCustomScrollView(),
    );
  }

  Widget _buildCustomScrollView() => CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 200,
          flexibleSpace: Image.asset(
            'images/loading.gif',
            fit: BoxFit.cover,
          ),
          floating: true,
          title: const Text('floating-app-bar'),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final item = _items[index];
              return ListTile(
                title: item.buildTitle(context),
                subtitle: item.buildSubTitle(context),
              );
            },
            childCount: 1000,
          ),
        ),
      ]);

  // AppBar _buildAppBar() => AppBar();

  // Widget _buildContent() => ListView.separated(
  //       itemCount: _items.length,
  //       separatorBuilder: (BuildContext context, int index) {
  //         return const SizedBox(height: 8);
  //       },
  //       itemBuilder: (BuildContext context, int index) {
  //         final item = _items[index];
  //         return ListTile(
  //           title: item.buildTitle(context),
  //           subtitle: item.buildSubTitle(context),
  //         );
  //       },
  //     );
}

abstract class ListItem {
  Widget buildTitle(BuildContext context);

  Widget buildSubTitle(BuildContext context);
}

class HeadingItem implements ListItem {
  HeadingItem(
    this.heading,
  );

  final String heading;

  @override
  Widget buildSubTitle(BuildContext context) => Text(
        heading,
        style: Theme.of(context).textTheme.headline5,
      );

  @override
  Widget buildTitle(BuildContext context) => const SizedBox.shrink();
}

class MessageItem extends ListItem {
  MessageItem(
    this.sender,
    this.body,
  );

  final String sender;
  final String body;

  @override
  Widget buildSubTitle(BuildContext context) => Text(sender);

  @override
  Widget buildTitle(BuildContext context) => Text(body);
}
