import 'package:project_flutter/constants/consts.dart';

Widget homeButtons({width, height, icon, String? title, onPress}) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          icon,
          width: 26,
        ),
        15.heightBox,
        title!.text.fontFamily(semi).color(darkFontGrey).make(),
      ],
    ),
  ).box.rounded.white.size(width, height).shadowSm.make();
}
