import 'package:project_flutter/constants/consts.dart';
import 'package:project_flutter/constants/lists.dart';
import 'package:project_flutter/view/home/components/feature_button.dart';
import 'package:project_flutter/widget_common/home_button.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12),
        color: lightGrey,
        width: context.screenWidth,
        height: context.screenHeight,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: context.screenWidth * 0.9,
                height: 50,
                color: lightGrey,
                child: TextFormField(
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    filled: true,
                    fillColor: whiteColor,
                    hintText: searchforany,
                    hintStyle: TextStyle(fontFamily: light, fontSize: 14),
                  ),
                ),
              ),
              15.heightBox,
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      VxSwiper.builder(
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          height: 140,
                          enlargeCenterPage: true,
                          itemCount: sliderList.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              sliderList[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .shadowSm
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 8))
                                .make();
                          }),
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            2,
                            (index) => homeButtons(
                                  height: context.screenHeight * 0.15,
                                  width: context.screenWidth / 2.5,
                                  icon: index == 0 ? icTodaysDeal : icFlashDeal,
                                  title: index == 0 ? tddeal : flashsale,
                                )),
                      ),
                      20.heightBox,
                      VxSwiper.builder(
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          height: 140,
                          enlargeCenterPage: true,
                          itemCount: secondSliderlist.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              secondSliderlist[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .shadowSm
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 8))
                                .make();
                          }),
                      15.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            3,
                            (index) => homeButtons(
                                  height: context.screenHeight * 0.13,
                                  width: context.screenWidth / 3.5,
                                  icon: index == 0
                                      ? icCategories
                                      : index == 1
                                          ? icBrands
                                          : icTopSeller,
                                  title: index == 0
                                      ? cate
                                      : index == 1
                                          ? brand
                                          : topSeller,
                                )),
                      ),
                      20.heightBox,
                      Align(
                          alignment: Alignment.centerLeft,
                          child: featureCate.text
                              .color(darkFontGrey)
                              .size(20)
                              .fontFamily(bold)
                              .make()),
                      10.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              3,
                              (index) => Column(
                                    children: [
                                      featureBtn(
                                        icon: featureimgList1[index],
                                        title: featureTitle1[index],
                                      ),
                                      10.heightBox,
                                      featureBtn(
                                        icon: featureimgList2[index],
                                        title: featureTitle2[index],
                                      )
                                    ],
                                  )).toList(),
                        ),
                      ),
                      20.heightBox,
                      Container(
                        padding: const EdgeInsets.all(12),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: redColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            featurePro.text
                                .fontFamily(bold)
                                .white
                                .size(18)
                                .make(),
                            10.heightBox,
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                    7,
                                    (index) => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              featureProimg[index],
                                              width: 150,
                                              fit: BoxFit.cover,
                                            ),
                                            10.heightBox,
                                            featureProTitle[index]
                                                .text
                                                .fontFamily(semi)
                                                .make(),
                                            5.heightBox,
                                            featurePrice[index]
                                                .text
                                                .fontFamily(bold)
                                                .color(redColor)
                                                .size(16)
                                                .make(),
                                          ],
                                        )
                                            .box
                                            .white
                                            .roundedSM
                                            .margin(const EdgeInsets.symmetric(
                                                horizontal: 10))
                                            .padding(const EdgeInsets.all(8))
                                            .make()),
                              ),
                            )
                          ],
                        ),
                      ),
                      20.heightBox,
                      VxSwiper.builder(
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          height: 140,
                          enlargeCenterPage: true,
                          itemCount: thirdSlider.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              thirdSlider[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .shadowSm
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 8))
                                .make();
                          }),
                      20.heightBox,
                      GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: productshow.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            mainAxisExtent: 250,
                          ),
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
                                productshowTitle[index]
                                    .text
                                    .fontFamily(semi)
                                    .make(),
                              ],
                            )
                                .box
                                .white
                                .shadowSm
                                .padding(const EdgeInsets.all(12))
                                .margin(const EdgeInsets.all(2))
                                .rounded
                                .make();
                          })
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
