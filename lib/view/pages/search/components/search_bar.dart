import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/color_theme.dart';
import '../search_controller.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.controller,
    required this.size,
  }) : super(key: key);

  final SearchController controller;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Obx(() => controller.lstSongs.isEmpty
              ? Container(
              key: UniqueKey(),
              margin: EdgeInsets.only(top: size.height * 0.37),
              child: Text(
                'Search music for your moods.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorTheme.color3,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ))
              : SizedBox(
            key: UniqueKey(),
          )),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 15, right: 15, top: 3),
          margin: EdgeInsets.only(
              left: size.width * 0.05,
              right: size.width * 0.05,
              top: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: const Offset(0, 6),
                )
              ],
              borderRadius: BorderRadius.circular(11)),
          child: TextField(
              onSubmitted: (keyword) async {
                if (!controller.isDataLoading.value) {
                  await controller.getApiMusic(keyword);
                }
              },
              textInputAction: TextInputAction.search,
              cursorColor: ColorTheme.color4,
              controller: controller.searchController,
              decoration: InputDecoration(
                  hintText: 'Search music...',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  suffixIcon: GestureDetector(
                      onTap: () async {
                        if (!controller.isDataLoading.value) {
                          await controller.getApiMusic(
                              controller.searchController.text);
                          FocusScope.of(context)
                              .requestFocus(FocusNode());
                        }
                      },
                      child: Icon(
                        Icons.search_rounded,
                        color: ColorTheme.color4,
                        size: 30,
                      )))),
        )
      ],
    );
  }
}
