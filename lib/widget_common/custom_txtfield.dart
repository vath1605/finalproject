import 'package:project_flutter/constants/consts.dart';

Widget customTxtfield({String? title, String? hint, controller,isPass}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(redColor).fontFamily(semi).size(16).make(),
      5.heightBox,
      TextField(
        controller: controller,
        decoration: InputDecoration(
            hintStyle: const TextStyle(fontFamily: semi, color: textFieldGrey),
            hintText: hint!,
            isDense: true,
            fillColor: lightGrey,
            filled: true,
            border: InputBorder.none,
            focusedBorder:
                const OutlineInputBorder(borderSide: BorderSide(color: redColor))),
      )
    ],
  );
}
