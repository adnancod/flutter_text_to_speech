import 'package:flutter/material.dart';
import 'package:flutter_text_to_speech/view_controller/tts_controller.dart';

class MyTextField extends StatelessWidget {
  final TtsController controller;
  const MyTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.textController,
      maxLines: 6,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        hintText: 'Enter Text',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
