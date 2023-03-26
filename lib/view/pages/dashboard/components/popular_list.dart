import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/color_theme.dart';
import '../../../../utils/constants.dart';
import '../dashboard_controller.dart';

class PopularList extends StatelessWidget {
  PopularList({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              top: 40, left: size.width * 0.05, right: size.width * 0.05),
          alignment: Alignment.centerLeft,
          child: Text(
            'Popular Artist',
            style: TextStyle(
                color: ColorTheme.color3,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        Obx(() => controller.isDataLoading.value
            ? Container(
                height: size.height * 0.5,
                child: const Center(child: CircularProgressIndicator()))
            : controller.musicModel == null
                ? Container(
                    height: size.height * 0.5,
                    child: Center(
                      child: GestureDetector(
                        onTap: () => controller.getApiMusic(),
                        child: const Text(
                          "Connection failure, click to try again",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                : Container(
                    height: size.height * 0.5,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisExtent: 220, crossAxisCount: 2),
                        itemCount: controller.musicModel!.results!.length,
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: ColorTheme.color4,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: ColorTheme.color4),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0.2,
                                      blurRadius: 3,
                                      offset: const Offset(
                                          2, 6), // changes position of shadow
                                    ),
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CachedNetworkImage(
                                      imageUrl: controller.musicModel!
                                          .results![index].artworkUrl100!),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: size.width * 0.3,
                                        child: Text(
                                            controller.musicModel!
                                                .results![index].artistName!,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: ColorTheme.color3,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      controller.musicModel!.results![index]
                                              .previewUrl.isNull
                                          ? Container()
                                          : Container(
                                              child: GestureDetector(
                                                child: const Icon(
                                                  Icons.play_arrow,
                                                  color: Colors.white,
                                                ),
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
                                              ),
                                            )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ))
      ],
    );
  }
}
