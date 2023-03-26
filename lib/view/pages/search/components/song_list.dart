import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/color_theme.dart';
import '../../../../utils/constants.dart';
import '../search_controller.dart';

class SongList extends StatelessWidget {
  const SongList({
    Key? key,
    required this.controller,
    required this.size,
  }) : super(key: key);

  final SearchController controller;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isDataLoading.value
        ? Container(
            height: size.height * 0.5,
            child: const Center(child: CircularProgressIndicator()))
        : controller.lstSongs.isEmpty
            ? Container(
                height: size.height * 0.5,
                child: const Center(
                  child: Text(
                    "",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              )
            : controller.musicModel == null
                ? Container(
                    height: size.height * 0.5,
                    child: Center(
                      child: GestureDetector(
                        onTap: () => controller
                            .getApiMusic(controller.searchController.text),
                        child: const Text(
                          "Connection failure, click to try again",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                : Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: size.height,
                        child: ListView.builder(
                            itemCount: controller.lstSongs.length,
                            itemBuilder: (_, index) {
                              return GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: ColorTheme.color4,
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: ColorTheme.color4),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 0.2,
                                          blurRadius: 3,
                                          offset: const Offset(2,
                                              6), // changes position of shadow
                                        ),
                                      ]),
                                  child: Row(
                                    children: [
                                      CachedNetworkImage(
                                          imageUrl: controller.lstSongs[index]
                                              ['artworkUrl100']),
                                      const SizedBox(
                                        width: 40,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: size.width * 0.4,
                                            child: Text(
                                                controller.lstSongs[index]
                                                    ['artistName'],
                                                maxLines: 1,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            width: size.width * 0.4,
                                            child: Text(
                                                controller.lstSongs[index]
                                                    ['trackName'],
                                                maxLines: 2,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          if (audioPlayer.playing) {
                                            audioPlayer.stop();
                                            Get.toNamed('audio_player',
                                                arguments: [
                                                  controller
                                                      .musicModel!
                                                      .results![index]
                                                      .previewUrl!,
                                                  controller
                                                      .musicModel!
                                                      .results![index]
                                                      .trackName!,
                                                  controller
                                                      .musicModel!
                                                      .results![index]
                                                      .artistName!,
                                                  controller
                                                      .musicModel!
                                                      .results![index]
                                                      .artworkUrl100!,
                                                ]);
                                          } else {
                                            Get.toNamed('audio_player',
                                                arguments: [
                                                  controller
                                                      .musicModel!
                                                      .results![index]
                                                      .previewUrl!,
                                                  controller
                                                      .musicModel!
                                                      .results![index]
                                                      .trackName!,
                                                  controller
                                                      .musicModel!
                                                      .results![index]
                                                      .artistName!,
                                                  controller
                                                      .musicModel!
                                                      .results![index]
                                                      .artworkUrl100!,
                                                ]);
                                          }
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: const [
                                            Icon(
                                              Icons.play_arrow_rounded,
                                              color: Colors.white,
                                              size: 34,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ));
  }
}
