import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      
      ),
      body: const Center(child: Text('Chat', style: TextStyle(fontSize: 40))),
    );
  }
}
