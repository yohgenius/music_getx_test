import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player_test/utils/color_theme.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'main_wrapper_controller.dart';


class MainWrapper extends StatelessWidget {
  MainWrapper({Key? key}) : super(key: key);

  final MainWrapperController _mainWrapperController =
      Get.put(MainWrapperController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: ColorTheme.color1,
        elevation: 0,
        notchMargin: 10,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          child: Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _bottomAppBarItem(
                    icon: Icons.home_rounded,
                    page: 0,
                    context,
                    label: "Home",
                  ),
                  _bottomAppBarItem(
                    icon: Icons.search_rounded,
                    page: 1,
                    context,
                    label: "Search",
                  ),
                ],
              )),
        ),
      ),
      body: PageView(
        controller: _mainWrapperController.pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: _mainWrapperController.animateToTab,
        children: [..._mainWrapperController.pages],
      ),
    );
  }

  Widget _bottomAppBarItem(BuildContext context,
      {required icon, required page, required label}) {
    return ZoomTapAnimation(
        onTap: () => _mainWrapperController.goToTab(page),
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: _mainWrapperController.currentPage == page
                    ? ColorTheme.appColors
                    : Colors.grey,
                size: 20,
              ),
              Text(
                label,
                style: TextStyle(
                    color: _mainWrapperController.currentPage == page
                        ? ColorTheme.appColors
                        : Colors.grey,
                    fontSize: 13,
                    fontWeight: _mainWrapperController.currentPage == page
                        ? FontWeight.w600
                        : null),
              )
            ],
          ),
        ));
  }
}
