import 'package:project_flutter/constants/consts.dart';

Widget featureBtn({String? title, icon}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Image.asset(
        icon,
        width: 40,
        fit: BoxFit.fill,
      ),
      title!.text.fontFamily(regular).size(15).color(darkFontGrey).make(),
    ],
  )
      .box
      .white
      .margin(const EdgeInsets.symmetric(horizontal: 5))
      .width(190)
      .height(60)
      .padding(const EdgeInsets.all(6))
      .roundedSM
      .outerShadow
      .make();
}
