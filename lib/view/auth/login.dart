import 'package:get/get.dart';
import 'package:project_flutter/constants/consts.dart';
import 'package:project_flutter/constants/lists.dart';
import 'package:project_flutter/controllers/auth_controller.dart';
import 'package:project_flutter/view/auth/signup.dart';
import 'package:project_flutter/view/home/home.dart';
import 'package:project_flutter/widget_common/appLogo_widget.dart';
import 'package:project_flutter/widget_common/bg_widget.dart';
import 'package:project_flutter/widget_common/btn.dart';
import 'package:project_flutter/widget_common/custom_txtfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return bgWidget(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogoWidget(),
              15.heightBox,
              "Log In To $appName".text.fontFamily(semi).white.size(20).make(),
              10.heightBox,
              Obx(
                () => Column(
                  children: [
                    customTxtfield(
                        title: email,
                        hint: emailHint,
                        isPass: false,
                        controller: controller.emailController),
                    10.heightBox,
                    customTxtfield(
                        title: password,
                        hint: passwordHint,
                        isPass: true,
                        controller: controller.passwordController),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {}, child: forgetPass.text.make())),
                    5.heightBox,
                    controller.isLoading.value
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          )
                        : myBtn(
                            colors: redColor,
                            title: logIn,
                            textColors: whiteColor,
                            onPress: () async {
                              controller.isLoading(true);
                              await controller
                                  .loginMethod(context: context)
                                  .then((value) {
                                if (value != null) {
                                  VxToast.show(context, msg: logged);
                                  Get.offAll(() => const Home());
                                } else {
                                  controller.isLoading(false);
                                }
                              });
                            },
                          ).box.width(context.screenWidth - 50).make(),
                    10.heightBox,
                    createnewAcc.text
                        .fontFamily(regular)
                        .color(fontGrey)
                        .size(14)
                        .make(),
                    10.heightBox,
                    myBtn(
                      colors: golden,
                      title: signUp,
                      textColors: whiteColor,
                      onPress: () {
                        Get.to(() => const SignupScreen());
                      },
                    ).box.width(context.screenWidth - 50).make(),
                    20.heightBox,
                    logInwith.text.size(12).color(fontGrey).make(),
                    5.heightBox,
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            3,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: CircleAvatar(
                                    backgroundColor: lightGrey,
                                    radius: 25,
                                    child: Image.asset(
                                      socialIc[index],
                                      width: 30,
                                    ),
                                  ),
                                ))),
                  ],
                )
                    .box
                    .white
                    .rounded
                    .shadowSm
                    .padding(const EdgeInsets.all(22))
                    .width(context.screenWidth - 80)
                    .make(),
              ),
              const Spacer(),
              credit.text.semiBold.make(),
              20.heightBox,
            ],
          ),
        ),
      ),
    ));
  }
}
