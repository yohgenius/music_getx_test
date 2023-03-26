import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../search_controller.dart';

class TopBanner extends StatelessWidget {
  const TopBanner({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SearchController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.lstSongs.isEmpty
        ? Opacity(
      opacity: 1,
      child: Container(
        height: 200,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/search_image.png'),
                fit: BoxFit.cover)),
        child: Row(),
      ),
    )
        : Opacity(
      opacity: 0.6,
      child: Container(
        height: 200,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/search_image.png'),
                fit: BoxFit.cover)),
        child: Row(),
      ),
    ));
  }
}
