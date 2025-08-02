import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../utils/languages_name.dart';
import '../../view_controller/tts_controller.dart';

class DropDownLanguages extends StatelessWidget {
  final TtsController controller;
  const DropDownLanguages({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 12, vertical: 16),
        ),
        value: controller.selectedLanguage.value,
        items: controller.languages.map((String language) {
          return DropdownMenuItem(
            value: language,
            child: Text(
                LanguageNames.languageNames[language] ?? language),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            controller.selectedLanguage.value = newValue;
            controller.checkLanguageSupport(newValue);
          }
        },
      );
    });
  }
}
