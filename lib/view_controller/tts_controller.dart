import 'package:flutter/material.dart';
import 'package:flutter_text_to_speech/utils/languages_name.dart';
import 'package:get/get.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TtsController extends GetxController {
  // TTS instance
  final FlutterTts tts = FlutterTts();

  //Text Controller
  final TextEditingController textController = TextEditingController();

  //Status Message
  final RxString statusMessage = ''.obs;

  //languages
  final RxList<String> languages = <String>[].obs;

  //selected language
  final RxString selectedLanguage = 'en-US'.obs;

  @override
  void onInit() {
    super.onInit();
    loadSupportedLanguages();
  }

  void loadSupportedLanguages() async {
    List<dynamic>? langs = await tts.getLanguages;
    if (langs != null) {
      final filteredLangs = langs
          .where((lang) => LanguageNames.languageNames.keys.contains(lang))
          .cast<String>()
          .toList();

      languages.value = filteredLangs;
    }
  }

  void onShowTextPressed()async{
    final typedText = textController.text.trim();
    if(typedText.isEmpty){
      statusMessage.value = 'Please Enter Some Text';
    }else{
      statusMessage.value = 'You typed: $typedText';
    }
  }

  void speakText()async{
    final typedText = textController.text.trim();
    if(typedText.isEmpty){
      statusMessage.value = 'Please Enter Some Text';
      return;
    }else{
        await tts.setLanguage(selectedLanguage.value);

        // Optionally set pitch, rate, volume
        await tts.setPitch(1);
        await tts.setSpeechRate(0.5);

        await tts.speak(typedText);
        statusMessage.value = 'Speaking...';
    }
  }

  @override
  void onClose() {
    textController.dispose();
    tts.stop();
    super.onClose();
  }
}
