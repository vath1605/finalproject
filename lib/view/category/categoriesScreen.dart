// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:project_flutter/constants/consts.dart';
import 'package:project_flutter/constants/lists.dart';
import 'package:project_flutter/view/category/cate_detail.dart';
import 'package:project_flutter/widget_common/bg_widget.dart';

class Catescreen extends StatelessWidget {
  const Catescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: cate.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: 9,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 230),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      cateImage[index],
                      width: 200,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                    40.heightBox,
                    cateList[index]
                        .text
                        .color(darkFontGrey)
                        .size(12)
                        .fontFamily(semi)
                        .align(TextAlign.center)
                        .make(),
                  ],
                )
                    .box
                    .white
                    .shadowSm
                    .rounded
                    .clip(Clip.antiAlias)
                    .make()
                    .onTap(() {
                  Get.to(() => CateDetail(title: cateList[index]));
                });
              }),
        ),
      ),
    );
  }
}
