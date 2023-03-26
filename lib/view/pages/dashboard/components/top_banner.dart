import 'package:flutter/material.dart';

import '../../../../utils/color_theme.dart';

class TopBanner extends StatelessWidget {
  const TopBanner({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              top: 15, left: size.width * 0.05, right: size.width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dashboard',
                style: TextStyle(
                    color: ColorTheme.color3,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Container(
          padding:
          const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
          margin: EdgeInsets.only(
              top: 20, left: size.width * 0.05, right: size.width * 0.05),
          decoration: BoxDecoration(
              color: ColorTheme.color2,
              image: const DecorationImage(
                  image: AssetImage('assets/images/dashboard.png'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 8, right: 15),
                  height: size.height * 0.15,
                  child: Text(
                    'Listen your favorite music',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: ColorTheme.color3,
                        fontSize: 26,
                        fontWeight: FontWeight.w900),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
