import 'package:flutter/material.dart';
import '../search_controller.dart';
import 'search_bar.dart';
import 'song_list.dart';
import 'top_bar.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.controller,
    required this.size,
  }) : super(key: key);

  final SearchController controller;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      alignment: Alignment.topCenter,
      children: [
        TopBanner(controller: controller),
        ListView(
          children: [
            SearchBar(controller: controller, size: size),
            SongList(controller: controller, size: size)
          ],
        )
      ],
    ));
  }
}
