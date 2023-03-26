
import 'package:flutter/material.dart';

import 'popular_list.dart';
import 'top_banner.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          TopBanner(size: size),
          PopularList(size: size),
        ],
      ),
    );
  }
}