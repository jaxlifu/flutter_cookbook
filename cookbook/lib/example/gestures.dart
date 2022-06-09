import 'package:flutter/material.dart';

class Ripples extends StatefulWidget {
  const Ripples({Key? key}) : super(key: key);

  @override
  State<Ripples> createState() => _RipplesState();
}

class _RipplesState extends State<Ripples> {
  final items = List<String>.generate(20, (index) => 'Item${index + 1}');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildContent(context),
    );
  }

  AppBar _buildAppBar() => AppBar();

  Widget _buildContent(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildInkWell(),
            _buildSeparator(),
            _buildGestureDetector(),
            _buildSeparator(),
            Expanded(child: _buildMessageList()),
          ],
        ),
        // child: _buildMessageList(),
      );

  ListView _buildMessageList() => ListView.separated(
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index) {
          return _buildSeparator();
        },
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return Dismissible(
              key: Key(item),
              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                color: Colors.red,
                child: const Text(
                  'mark as read',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              // secondaryBackground: Container(color: Colors.amber),
              direction: DismissDirection.endToStart,
              crossAxisEndOffset: 0.25,
              confirmDismiss: (direction) {
                return showDialog<bool>(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return AlertDialog(
                      content: const Text('Confirm delete'),
                      actions: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          child: const Text('Confirm'),
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child: const Text('Cancel'),
                        ),
                      ],
                    );
                  },
                );
              },
              onDismissed: (direction) {
                debugPrint(direction.toString());
                if (direction == DismissDirection.endToStart) {
                  setState(() {
                    items.removeAt(index);
                  });
                  _showSnackBar(content: Text('$item dismissed'));
                }
              },
              child: ListTile(
                title: Text(item),
              ));
        },
      );

  Widget _buildInkWell() => InkWell(
        onTap: () {
          _showSnackBar(content: const Text('InkWell click'));
        },
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text('Flat Button'),
        ),
      );

  Widget _buildGestureDetector() => GestureDetector(
        onTap: () {
          _showSnackBar(content: const Text('GestureDetector click'));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(12.0),
          child: const Text('Flat Button'),
        ),
      );

  void _showSnackBar({required Widget content}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: content),
    );
  }

  Widget _buildSeparator() => const SizedBox(height: 8.0);
}
