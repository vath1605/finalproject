import 'package:get/get.dart';
import 'package:project_flutter/constants/consts.dart';
import 'package:project_flutter/controllers/home_controller.dart';
import 'package:project_flutter/view/account/accountScreen.dart';
import 'package:project_flutter/view/cart/cartScreen.dart';
import 'package:project_flutter/view/category/categoriesScreen.dart';
import 'package:project_flutter/view/home/homeScreen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    var navBarItems = [
      BottomNavigationBarItem(
          icon: Image.asset(
            icHome,
            width: 26,
          ),
          label: home),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCategories,
            width: 26,
          ),
          label: cate),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCart,
            width: 26,
          ),
          label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: 26,
          ),
          label: acc),
    ];

    var navBody = [
      const Homescreen(),
      const Catescreen(),
      const Cartscreen(),
      const Accountscreen()
    ];

    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: redColor,
          selectedLabelStyle: const TextStyle(fontFamily: semi, fontSize: 14),
          backgroundColor: whiteColor,
          items: navBarItems,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
        ),
      ),
    );
  }
}
