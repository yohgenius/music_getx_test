import 'package:flutter/material.dart';

import '../../../utils/color_theme.dart';
import 'components/body.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorTheme.color1,
      body: Body(size: size),
    );
  }
}

