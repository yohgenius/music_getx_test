import 'dart:developer';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

import '../../../utils/constants.dart';

class PlayerController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  var isPlaying = false.obs;
  String audioLink = Get.arguments[0];
  String title = Get.arguments[1];
  String name = Get.arguments[2];
  String cover = Get.arguments[3];
  var duration = ''.obs;
  var position = ''.obs;
  var max = 0.0.obs;
  var value = 0.0.obs;


  void playSong() {
    try {
      audioPlayer.setAudioSource(AudioSource.uri(
        Uri.parse(audioLink),
        tag: MediaItem(
          // Specify a unique ID for each media item:
          id: '1',
          // Metadata to display in the notification:
          title: "$name - $title",
          artUri: Uri.parse(cover),
        ),
      ));
      isPlaying.value = true;
      audioPlayer.play();
      updatePosition(duration, max, position, value);

    } on Exception {
      log("Error playing");
    }
  }

  updatePosition(var duration, var max, var position, var value) {
    audioPlayer.durationStream.listen((d) {
      duration.value = d.toString().split(".")[0];
      max.value = d!.inSeconds.toDouble();
    });

    audioPlayer.positionStream.listen((p) {
      position.value = p.toString().split(".")[0];
      value.value = p.inSeconds.toDouble();
    });
  }

  void changeToSeconds(seconds) {
    var duration = Duration(seconds: seconds);
    audioPlayer.seek(duration);
  }
}
