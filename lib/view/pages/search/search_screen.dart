import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_test/view/pages/search/search_controller.dart';
import '../../../utils/color_theme.dart';
import 'components/body.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  SearchController controller = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorTheme.color1,
      body: Body(controller: controller, size: size),
    );
  }
}

