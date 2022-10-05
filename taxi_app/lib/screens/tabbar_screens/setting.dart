import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: const Center(child: Text('Setting', style: TextStyle(fontSize: 40))),
    );
  }
}