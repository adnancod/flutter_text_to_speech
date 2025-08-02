import 'package:flutter/material.dart';
import 'package:flutter_text_to_speech/utils/languages_name.dart';
import 'package:get/get.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TtsController extends GetxController {
  // TTS instance
  final FlutterTts tts = FlutterTts();

  //Text Controller
  final TextEditingController textController = TextEditingController();

  //play/pause
  final isPlaying = false.obs;

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

    statusMessage.value = 'Tap to Play';

    // Reset to play when speaking is complete
    tts.setCompletionHandler(() {
      isPlaying.value = false;
      statusMessage.value = 'Speech completed.';
    });
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

  void togglePlayPause(){
    final typedText = textController.text.trim();
    if (typedText.isEmpty) {
      statusMessage.value = 'Please Enter Some Text';
      return; // Don't proceed
    }
    isPlaying.value = !isPlaying.value;
    if (isPlaying.value) {
      speakText();
    } else {
      pauseAudio();
    }
  }

  Future<void> checkLanguageSupport(String languageCode) async {
    bool isSupported = await tts.isLanguageAvailable(languageCode);
    if (!isSupported) {
      statusMessage.value = "Language not supported on this device.";
    } else {
      await tts.setLanguage(languageCode);
    }
  }

  void speakText()async{
    final typedText = textController.text.trim();
        await tts.setLanguage(selectedLanguage.value);

        // Optionally set pitch, rate, volume
        await tts.setPitch(1);
        await tts.setSpeechRate(0.5);

        await tts.speak(typedText);
        statusMessage.value = 'Speaking...';
  }

  void pauseAudio()async{
    await tts.pause();
    statusMessage.value = 'Speech Paused';
  }

  @override
  void onClose() {
    textController.dispose();
    tts.stop();
    super.onClose();
  }
}
