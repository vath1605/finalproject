import 'package:project_flutter/constants/consts.dart';

Widget detailCart({width, String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.fontFamily(bold).color(darkFontGrey).size(16).make(),
      5.heightBox,
      title!.text.color(darkFontGrey).size(12).make(),
    ],
  )
      .box
      .shadow
      .roundedSM
      .white
      .width(width)
      .padding(const EdgeInsets.all(4))
      .height(80)
      .make();
}
