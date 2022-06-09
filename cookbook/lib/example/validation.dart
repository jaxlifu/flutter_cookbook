import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  late FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _printLastesValue();
    });

    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(context),
      appBar: _buildAppBar(),
      floatingActionButton: _buildFloatActionButton(),
    );
  }

  FloatingActionButton _buildFloatActionButton() {
    return FloatingActionButton(
      onPressed: () {
        _focusNode.requestFocus();
        if (_controller.text.isEmpty) {
          return;
        }
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(_controller.text),
              );
            });
      },
      tooltip: 'Show me the value',
      child: const Icon(Icons.text_fields),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Custom Form'),
    );
  }

  Form _buildContent(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            _buildSpace(),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
            _buildSpace(),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'listener with onChanged',
              ),
              onChanged: (text) {
                debugPrint('First text field $text');
              },
            ),
            _buildSpace(),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'listener with controller',
              ),
              controller: _controller,
            ),
            _buildSpace(),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'listener with focusNode',
              ),
              focusNode: _focusNode,
            ),
            _buildSpace(),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your username',
              ),
            ),
            _buildSpace(),
            _buildInkWell(),
          ],
        ),
      ),
    );
  }

  Widget _buildInkWell() => InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Tap'),
            ),
          );
        },
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text('Flat Button'),
        ),
      );

  SizedBox _buildSpace() => const SizedBox(height: 16);

  void _printLastesValue() {
    debugPrint('Second text field: ${_controller.text}');
  }
}
