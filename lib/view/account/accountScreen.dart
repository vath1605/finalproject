import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:project_flutter/constants/consts.dart';
import 'package:project_flutter/constants/lists.dart';
import 'package:project_flutter/controllers/auth_controller.dart';
import 'package:project_flutter/controllers/profile_controller.dart';
import 'package:project_flutter/services/firestore_services.dart';
import 'package:project_flutter/view/account/components/details_cart.dart';
import 'package:project_flutter/view/account/editProfile.dart';
import 'package:project_flutter/view/auth/login.dart';
import 'package:project_flutter/widget_common/bg_widget.dart';

class Accountscreen extends StatelessWidget {
  const Accountscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgWidget(
      child: Scaffold(
          body: StreamBuilder(
              stream: FirestoreServices.getUser(currentUser!.uid),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    ),
                  );
                } else {
                  var data = snapshot.data!.docs[0];
                  return SafeArea(
                      child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: const Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.edit,
                                color: whiteColor,
                              ),
                            ).onTap(() {
                              Get.to(EditProfileScreen(
                                data: data,
                              ));
                            }),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                controller.profileImgPath.isEmpty
                                    ? Image.asset(
                                        imgProfile2,
                                        width: 90,
                                        fit: BoxFit.cover,
                                      )
                                        .box
                                        .roundedFull
                                        .clip(Clip.antiAlias)
                                        .make()
                                    : Image.file(
                                        File(controller.profileImgPath.value),
                                        width: 100,
                                        fit: BoxFit.cover,
                                      )
                                        .box
                                        .roundedFull
                                        .clip(Clip.antiAlias)
                                        .make(),
                                7.widthBox,
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    "${data['name']}"
                                        .text
                                        .fontFamily(semi)
                                        .size(13)
                                        .white
                                        .make(),
                                    4.heightBox,
                                    "${data['email']}"
                                        .text
                                        .size(12)
                                        .white
                                        .fontFamily(regular)
                                        .make(),
                                  ],
                                )),
                                OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        side: const BorderSide(
                                            color: whiteColor)),
                                    onPressed: () async {
                                      await Get.put(AuthController())
                                          .signOutMethod(context);
                                      Get.offAll(() => const LoginScreen());
                                    },
                                    child: logOut.text
                                        .color(whiteColor)
                                        .fontFamily(bold)
                                        .make())
                              ],
                            ),
                          ),
                          30.heightBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              detailCart(
                                  width: context.screenWidth / 3.25,
                                  count: "${data['cart_count']}",
                                  title: "in your cart"),
                              detailCart(
                                  width: context.screenWidth / 3.25,
                                  count: "${data['wishlist_count']}",
                                  title: "in your wishlist"),
                              detailCart(
                                  width: context.screenWidth / 3.25,
                                  count: "${data['order_count']}",
                                  title: "your order"),
                            ],
                          ),
                          ListView.separated(
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) {
                                    return const Divider(
                                      color: lightGrey,
                                    );
                                  },
                                  itemCount: pfBtnIclist.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return ListTile(
                                      leading: Image.asset(
                                        pfBtnIclist[index],
                                        width: 20,
                                      ),
                                      title: pfBtnList[index]
                                          .text
                                          .fontFamily(regular)
                                          .color(darkFontGrey)
                                          .make(),
                                    );
                                  })
                              .box
                              .padding(
                                  const EdgeInsets.symmetric(horizontal: 16))
                              .shadowSm
                              .rounded
                              .margin(const EdgeInsets.all(12))
                              .white
                              .make()
                              .box
                              .make()
                        ],
                      ),
                    ],
                  ));
                }
              })),
    );
  }
}
