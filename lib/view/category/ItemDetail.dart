import 'package:project_flutter/constants/consts.dart';
import 'package:project_flutter/constants/lists.dart';
import 'package:project_flutter/widget_common/btn.dart';

class ItemsDetail extends StatelessWidget {
  final String? title;
  const ItemsDetail({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: title!.text.size(20).fontFamily(semi).color(darkFontGrey).make(),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                color: darkFontGrey,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VxSwiper.builder(
                      autoPlay: true,
                      itemCount: 3,
                      aspectRatio: 16 / 9,
                      height: 280,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imgFc5,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      }),
                  15.heightBox,
                  title!.text
                      .size(16)
                      .fontFamily(semi)
                      .color(darkFontGrey)
                      .make(),
                  15.heightBox,
                  VxRating(
                    onRatingUpdate: (value) {},
                    normalColor: textFieldGrey,
                    selectionColor: golden,
                    count: 5,
                    stepInt: true,
                    maxRating: 10,
                  ),
                  20.heightBox,
                  "\$30.00"
                      .text
                      .fontFamily(bold)
                      .color(redColor)
                      .size(18)
                      .make(),
                  20.heightBox,
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          "Seller"
                              .text
                              .fontFamily(semi)
                              .color(darkFontGrey)
                              .make(),
                          5.heightBox,
                          "In house brand."
                              .text
                              .fontFamily(semi)
                              .color(darkFontGrey)
                              .make(),
                        ],
                      )),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.message_rounded),
                      )
                    ],
                  )
                      .box
                      .height(70)
                      .padding(const EdgeInsets.symmetric(horizontal: 16))
                      .color(textFieldGrey)
                      .rounded
                      .make(),
                  20.heightBox,
                  Column(children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Color : "
                              .text
                              .fontFamily(bold)
                              .size(18)
                              .color(textFieldGrey)
                              .make(),
                        ),
                        Row(
                          children: List.generate(
                            3,
                            (index) => VxBox()
                                .size(40, 40)
                                .roundedFull
                                .color(Vx.randomPrimaryColor)
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 5))
                                .make(),
                          ),
                        )
                      ],
                    )
                        .box
                        .padding(const EdgeInsets.symmetric(horizontal: 16))
                        .make(),
                    10.heightBox,
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Quantity : "
                              .text
                              .fontFamily(bold)
                              .size(18)
                              .color(textFieldGrey)
                              .make(),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () => {},
                                icon: const Icon(Icons.remove)),
                            "0"
                                .text
                                .size(24)
                                .fontFamily(semi)
                                .color(darkFontGrey)
                                .make(),
                            IconButton(
                                onPressed: () => {},
                                icon: const Icon(Icons.add)),
                            10.widthBox,
                            "(0 available)".text.color(textFieldGrey).make(),
                          ],
                        )
                      ],
                    )
                        .box
                        .padding(const EdgeInsets.symmetric(horizontal: 16))
                        .make(),
                    10.heightBox,
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Total :           "
                              .text
                              .fontFamily(bold)
                              .size(18)
                              .color(textFieldGrey)
                              .make(),
                        ),
                        10.widthBox,
                        "\$ 0.00"
                            .text
                            .fontFamily(semi)
                            .color(redColor)
                            .size(22)
                            .make()
                      ],
                    )
                        .box
                        .padding(const EdgeInsets.symmetric(horizontal: 16))
                        .make(),
                  ])
                      .box
                      .white
                      .shadowSm
                      .rounded
                      .padding(const EdgeInsets.all(10))
                      .make(),
                  20.heightBox,
                  "Description"
                      .text
                      .fontFamily(semi)
                      .size(20)
                      .color(darkFontGrey)
                      .make(),
                  20.heightBox,
                  "Available now at e-24, where delicious meets convenience. Order today and elevate your dining experience!"
                      .text
                      .fontFamily(semi)
                      .size(14)
                      .color(darkFontGrey)
                      .make(),
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(
                      itemBtnDetailList.length,
                      (index) => ListTile(
                        title: itemBtnDetailList[index]
                            .text
                            .fontFamily(semi)
                            .color(darkFontGrey)
                            .make(),
                        trailing: const Icon(Icons.arrow_forward_sharp),
                      ),
                    ),
                  ),
                  20.heightBox,
                  proUmaylike.text.color(darkFontGrey).fontFamily(bold).make(),
                  20.heightBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          7,
                          (index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
          )),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: myBtn(
                onPress: () => {},
                colors: redColor,
                textColors: whiteColor,
                title: addToCart),
          ),
          5.heightBox,
        ],
      ),
    );
  }
}
