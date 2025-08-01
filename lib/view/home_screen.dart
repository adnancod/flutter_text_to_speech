import 'package:flutter/material.dart';
import 'package:flutter_text_to_speech/utils/languages_name.dart';
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: controller.textController,
              maxLines: 5,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                hintText: 'Enter Text',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Obx(() {
              return DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: 'Select Language',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey, // same color as unfocused
                      width: 1.0,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                ),
                value: controller.selectedLanguage.value,
                items: controller.languages.map((String language) {
                  return DropdownMenuItem(
                    value: language,
                    child: Text(LanguageNames.languageNames[language] ?? language),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    controller.selectedLanguage.value = newValue;
                  }
                },
              );
            }),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: controller.onShowTextPressed,
              child: Text('Show Typed Text'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: controller.speakText,
              child: Text('Play'),
            ),
            const SizedBox(height: 16),
            Obx(() {
              return Text(
                controller.statusMessage.value,
                style: const TextStyle(fontSize: 16),
              );
            }),
            Obx(() => Text(
              "Selected Language: ${controller.selectedLanguage.value}",
              style: TextStyle(fontSize: 16, color: Colors.black),
            )),
          ],
        ),
      ),
    );
  }
}
