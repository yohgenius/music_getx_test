import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_test/view/pages/music_player/player_controller.dart';
import '../../../utils/constants.dart';
import 'components/body.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  PlayerController controller = Get.put(PlayerController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (!audioPlayer.playing) {
      controller.playSong();
    }
    controller.isPlaying.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(controller: controller),
    );
  }
}
