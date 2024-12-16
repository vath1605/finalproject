import 'dart:io';
import 'package:get/get.dart';
import 'package:project_flutter/constants/consts.dart';
import 'package:project_flutter/controllers/profile_controller.dart';
import 'package:project_flutter/widget_common/bg_widget.dart';
import 'package:project_flutter/widget_common/btn.dart';
import 'package:project_flutter/widget_common/custom_txtfield.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    controller.nameController.text = data['name'];
    controller.oldpassController.text = data['password'];
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              controller.profileImgPath.isEmpty
                  ? Image.asset(
                      imgProfile2,
                      width: 90,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()
                  : Image.file(
                      File(controller.profileImgPath.value),
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
              // 10.heightBox,
              // myBtn(
              //   colors: redColor,
              //   textColors: whiteColor,
              //   title: "Change",
              //   onPress: () {
              //     Get.find<ProfileController>().changeImage(context);
              //   },
              // ),
              // const Divider(),
              20.heightBox,
              customTxtfield(
                controller: controller.nameController,
                hint: nameHint,
                title: name,
                isPass: false,
              ),
              customTxtfield(
                controller: controller.oldpassController,
                hint: password,
                title: password,
                isPass: true,
              ),
              20.heightBox,
              SizedBox(
                width: context.screenWidth - 60,
                child: myBtn(
                    onPress: () {
                      controller.changeImage(context);
                    },
                    colors: redColor,
                    textColors: whiteColor,
                    title: "Change"),
              ),
            ],
          )
              .box
              .white
              .shadowSm
              .padding(const EdgeInsets.all(16))
              .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
              .roundedSM
              .make(),
        ),
      ),
    ));
  }
}
