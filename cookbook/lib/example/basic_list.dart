import 'package:flutter/material.dart';

class BasicList extends StatefulWidget {
  const BasicList({Key? key}) : super(key: key);

  @override
  State<BasicList> createState() => _BasicListState();
}

class _BasicListState extends State<BasicList> {
  final _icons = <IconData>[
    Icons.abc,
    Icons.baby_changing_station,
    Icons.cabin,
    Icons.dangerous,
    Icons.e_mobiledata,
    Icons.face,
    Icons.g_mobiledata,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildContext(),
    );
  }

  AppBar _buildAppBar() => AppBar();
  Widget _buildContext() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildListView(),
      );

  Widget _buildGridView() => GridView.count(
        crossAxisCount: 2,
        children: List.generate(100, (index) {
          return Center(
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headline5,
            ),
          );
        }),
      );

  Widget _buildListView() => ListView.separated(
        itemCount: 30,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 16);
        },
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return SizedBox(
              height: 300,
              child: _buildGridView(),
            );
          }
          index -= 1;
          if (index.isOdd) {
            return SizedBox(
              height: 50,
              child: _buildHorizontalListView(index),
            );
          } else {
            final length = _icons.length;
            final icon = _icons[index ~/ 2 % length];
            return ListTile(
              leading: Icon(icon),
              title: Text(icon.toString()),
            );
          }
        },
      );

  Widget _buildHorizontalListView(int length) => ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          length,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 50,
              color: Colors.accents[index % 16],
              alignment: Alignment.center,
              child: Text('$index'),
            ),
          ),
        ),
      );
}
