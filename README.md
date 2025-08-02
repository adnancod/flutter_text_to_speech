

````markdown
# 🌐 Multilingual Text-to-Speech (TTS) Demo – Flutter

A simple Flutter app demonstrating multilingual text-to-speech functionality using the `flutter_tts` plugin. Users can select a language, type any sentence, and hear it spoken aloud. The app also provides a smooth audio UI, and handles unsupported language cases.

## 🚀 Features

- ✅ Dropdown for selecting multiple languages (e.g., English, French, Spanish, Urdu, Arabic, etc.)
- ✅ TextField to enter text
- ✅ Play / Pause functionality with icon switching
- ✅ Toggle between male and female voices (on repeated play taps, if supported)
- ✅ Error handling for unsupported languages

## 🧠 How It Works

1. Select a language from the dropdown (e.g., French).
2. Enter your text in the field (e.g., “Bonjour, comment ça va?”).
3. Tap the **Play** icon to hear the voice in selected language and voice.
4. Tap again to switch voice gender (if supported).
5. Pause/resume audio using the same button.
6. When the audio finishes, the UI resets automatically.

## 📸 Screenshot
![flutter_tts](https://github.com/user-attachments/assets/33e0c527-92c5-4b65-ab73-44951813a38a)


## 📸 Demo

[Click here to watch the demo video](https://drive.google.com/file/d/1ftRvTAkJWei0w5KMi_VHQiJV85LbutCG/view?usp=sharing)
 
*Screen recording showing language selection, text input, playback.*

## 📦 Packages Used

- [`flutter_tts`](https://pub.dev/packages/flutter_tts) – Text-to-Speech plugin
- [`get`](https://pub.dev/packages/get) – (For State Management)

## 🔧 Setup Instructions

1. Clone the repo:
   ```bash
   git clone https://github.com/your-username/tts-flutter-demo.git
   cd tts-flutter-demo
````

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the app:

   ```bash
   flutter run
   ```

> 💡 Make sure your emulator or device has TTS engines installed and supports the selected language.

## ⚠️ Known Limitations

* Not all devices support every language or voice gender.
* Voice gender switching works only if multiple voices are available for the selected language.
* Internet may be required for some languages or TTS engines.

## 📁 Project Structure

```
lib/
├── main.dart
├── view_model/
    ├── tts_controller.dart
├── view/
│   ├── home_screen.dart
│   └── widgets/
│       ├── drop_down_languages.dart.dart
│       ├── my_text_field.dart.dart
│       └── play_button.dart.dart
├── utils/
│   └── languages_name.dart.dart
```

## 🧑‍💻 Author

**Muhammad Adnan**
📧 [adnantech.dev@gmail.com](mailto:adnantech.dev@gmail.com)
🔗 [LinkedIn](https://linkedin.com/in/adnancod) | [GitHub](https://github.com/adnancod)

