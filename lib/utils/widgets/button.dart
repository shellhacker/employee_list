import 'package:employee_list/utils/const/colors.dart';
import 'package:employee_list/utils/const/text_style.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({super.key, required this.title, required this.onTap});
  String title;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 280,
        height: 40,
        decoration: BoxDecoration(
            color: AppColor.primaryCOlor,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Center(child: Text(title, style: AppText.buttonFont)),
      ),
    );
  }
}
