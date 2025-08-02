import 'package:flutter/material.dart';
import 'package:flutter_text_to_speech/view/widgets/drop_down_languages.dart';
import 'package:flutter_text_to_speech/view/widgets/my_text_field.dart';
import 'package:flutter_text_to_speech/view/widgets/play_button.dart';
import 'package:get/get.dart';
import '../view_controller/tts_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TtsController controller = Get.put(TtsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text To Speech'),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            MyTextField(controller: controller),
            const SizedBox(height: 16),
            DropDownLanguages(controller: controller),
            const SizedBox(height: 32),
            PlayButton(controller: controller),
            const SizedBox(height: 16),
            Obx(() {
              return Text(
                controller.statusMessage.value,
                style: const TextStyle(fontSize: 16),
              );
            }),
          ],
        ),
      ),
    );
  }
}
