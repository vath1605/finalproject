import 'package:project_flutter/constants/consts.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: "Cart is empty!".text.fontFamily(bold).makeCentered(),
    );
  }
}
