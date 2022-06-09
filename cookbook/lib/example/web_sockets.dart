import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ExampleWebSockets extends StatefulWidget {
  const ExampleWebSockets({Key? key}) : super(key: key);

  @override
  State<ExampleWebSockets> createState() => _ExampleWebSocketsState();
}

class _ExampleWebSocketsState extends State<ExampleWebSockets> {
  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://echo.websocket.events'),
  );
  late final TextEditingController _editingController;

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController();
  }

  @override
  void dispose() {
    _channel.sink.close();
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildContent(),
      floatingActionButton: _builtSendMessageButton(),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            controller: _editingController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Send a message',
            ),
          ),
          const SizedBox(height: 24),
          StreamBuilder(
            stream: _channel.stream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Text(snapshot.hasData ? snapshot.data : '');
            },
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() => AppBar();

  Widget _builtSendMessageButton() => FloatingActionButton(
        onPressed: () {
          if (_editingController.text.isNotEmpty) {
            _channel.sink.add(_editingController.text);
          }
        },
        child: const Icon(Icons.send),
      );
}
