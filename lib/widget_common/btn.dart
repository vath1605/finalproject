import 'package:project_flutter/constants/consts.dart';

Widget myBtn(
    {required Function() onPress,
    required Color colors,
    required Color textColors,
    required String title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: colors,
      padding: const EdgeInsets.all(12),
    ),
    onPressed: onPress, // Correct way to call the function
    child: title.text.color(textColors).sm.fontFamily(semi).size(16).make(),
  );
}
