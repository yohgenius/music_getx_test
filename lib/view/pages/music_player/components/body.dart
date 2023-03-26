import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/color_theme.dart';
import '../../../../utils/constants.dart';
import '../player_controller.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PlayerController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Column(
              children: [
                Container(
                  height: 200,
                  child: Image.network(
                    controller.cover,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "${controller.name} - ${controller.title}",
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Row(
                    children: [
                      Text(controller.position.value),
                      Expanded(
                        child: Slider(
                            activeColor: const Color(0xFF71B77A),
                            inactiveColor: const Color(0xFFEFEFEF),
                            value: controller.value.value,
                            min: 0.0,
                            max: controller.max.value,
                            onChanged: (value) {
                              controller.changeToSeconds(value.toInt());
                              value = value;
                            }),
                      ),
                      Text(controller.duration.value)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorTheme.color1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: GestureDetector(
                          onTap: () {
                            if (!controller.isPlaying.value) {
                              audioPlayer.play();
                            } else {
                              audioPlayer.pause();
                            }
                            controller.isPlaying.value =
                                !controller.isPlaying.value;
                          },
                          child: Obx(
                            () => controller.isPlaying.value
                                ? const Icon(
                                    Icons.pause,
                                    size: 70,
                                  )
                                : const Icon(
                                    Icons.play_arrow_rounded,
                                    size: 70,
                                  ),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
