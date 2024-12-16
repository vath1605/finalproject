import 'package:get/get.dart';
import 'package:project_flutter/constants/consts.dart';
import 'package:project_flutter/controllers/auth_controller.dart';
import 'package:project_flutter/view/home/home.dart';
import 'package:project_flutter/widget_common/appLogo_widget.dart';
import 'package:project_flutter/widget_common/bg_widget.dart';
import 'package:project_flutter/widget_common/btn.dart';
import 'package:project_flutter/widget_common/custom_txtfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogoWidget(),
              15.heightBox,
              "Sign Up To $appName".text.fontFamily(semi).white.size(20).make(),
              10.heightBox,
              Obx(
                () => Column(
                  children: [
                    customTxtfield(
                        title: name,
                        hint: nameHint,
                        controller: nameController,
                        isPass: false),
                    10.heightBox,
                    customTxtfield(
                        title: email,
                        hint: emailHint,
                        controller: emailController,
                        isPass: false),
                    10.heightBox,
                    customTxtfield(
                        title: password,
                        hint: passwordHint,
                        controller: passwordController,
                        isPass: true),
                    10.heightBox,
                    customTxtfield(
                        title: conpass,
                        hint: passwordHint,
                        controller: passwordRetypeController,
                        isPass: true),
                    10.heightBox,
                    Row(
                      children: [
                        Checkbox(
                          value: isCheck,
                          onChanged: (newValue) {
                            setState(() {
                              isCheck = newValue;
                            });
                          },
                        ),
                        5.widthBox,
                        RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              text: "I agree to the ",
                              style: TextStyle(
                                  fontFamily: regular,
                                  color: fontGrey,
                                  fontSize: 12)),
                          TextSpan(
                              text: privacy,
                              style: TextStyle(
                                  fontFamily: regular,
                                  color: redColor,
                                  fontSize: 12)),
                          TextSpan(
                              text: " and\n",
                              style: TextStyle(
                                  fontFamily: regular,
                                  color: fontGrey,
                                  fontSize: 12)),
                          TextSpan(
                              text: term,
                              style: TextStyle(
                                  fontFamily: regular,
                                  color: redColor,
                                  fontSize: 12))
                        ]))
                      ],
                    ),
                    10.heightBox,
                    controller.isLoading.value
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          )
                        : myBtn(
                            colors: isCheck == true ? redColor : lightGrey,
                            title: signUp,
                            textColors: whiteColor,
                            onPress: () async {
                              if (isCheck != false) {
                                controller.isLoading(true);
                                try {
                                  await controller
                                      .signupMethod(
                                    context: context,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  )
                                      .then((value) {
                                    return controller.storeUserData(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      name: nameController.text,
                                    );
                                  }).then((value) {
                                    VxToast.show(context, msg: logged);
                                    Get.offAll(() => const Home());
                                  });
                                } catch (e) {
                                  controller.isLoading(false);
                                  auth.signOut();
                                  VxToast.show(context, msg: e.toString());
                                }
                              }
                            },
                          ).box.width(context.screenWidth - 50).make(),
                    10.heightBox,
                    RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                            text: alr,
                            style: TextStyle(
                                fontFamily: regular, color: fontGrey)),
                        TextSpan(
                            text: logIn,
                            style:
                                TextStyle(fontFamily: semi, color: redColor)),
                      ]),
                    ).onTap(() {
                      Get.back();
                    }),
                    10.heightBox,
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
