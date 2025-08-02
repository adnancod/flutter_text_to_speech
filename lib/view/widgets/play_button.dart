import 'package:flutter/material.dart';
import 'package:flutter_text_to_speech/view_controller/tts_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class PlayButton extends StatelessWidget {
  final TtsController controller;

  const PlayButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.togglePlayPause,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(),
          color: Colors.lightBlueAccent.withOpacity(0.2),
        ),
        child: Obx(() {
          return Icon(
            controller.isPlaying.value ? Icons.pause : Icons.play_arrow,
            size: 40,
            color: Colors.lightBlueAccent,
          );
        }),
      ),
    );
  }
}
