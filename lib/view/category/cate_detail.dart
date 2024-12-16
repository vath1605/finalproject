import 'package:get/get.dart';
import 'package:project_flutter/constants/consts.dart';
import 'package:project_flutter/constants/lists.dart';
import 'package:project_flutter/view/category/ItemDetail.dart';
import 'package:project_flutter/widget_common/bg_widget.dart';

class CateDetail extends StatelessWidget {
  final String? title;
  const CateDetail({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        title: title!.text.fontFamily(bold).white.make(),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    6,
                    (index) => manClothingFash[index]
                        .text
                        .size(14)
                        .fontFamily(bold)
                        .color(darkFontGrey)
                        .makeCentered()
                        .box
                        .white
                        .margin(const EdgeInsets.symmetric(horizontal: 6))
                        .size(150, 60)
                        .rounded
                        .shadowSm
                        .make()),
              ),
            ),
            10.heightBox,
            Expanded(
                child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 8,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 250,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            productshow[index],
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          const Spacer(),
                          productshowTitle[index].text.fontFamily(semi).make(),
                        ],
                      )
                          .box
                          .white
                          .shadowSm
                          .padding(const EdgeInsets.all(12))
                          .margin(const EdgeInsets.all(2))
                          .rounded
                          .outerShadowSm
                          .make()
                          .onTap(() {
                        Get.to(() => ItemsDetail(title: title!));
                      });
                    }))
          ],
        ),
      ),
    ));
  }
}
