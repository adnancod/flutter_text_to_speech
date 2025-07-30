import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text To Speech'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextFormField(
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'Enter Text',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
          )
        ],
      ),
    );
  }
}
