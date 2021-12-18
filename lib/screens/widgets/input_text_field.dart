
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.suffixIcon,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    required this.controller,
    this.editingTextColor = const Color(0XFF9A9696),
    this.cursorColor = Colors.grey,
  }) : super(key: key);

  final String labelText;
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final TextEditingController controller;
  final bool obscureText;
  final Color editingTextColor;
  final Color cursorColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: obscureText,
      obscuringCharacter: '*',
      cursorColor: cursorColor,
      decoration: InputDecoration(
        isDense: true,
        labelText: labelText,
        hintText: hintText,
        alignLabelWithHint: true,
        suffixIcon: suffixIcon,
        suffixIconConstraints: BoxConstraints(minHeight: 28.h, minWidth: 28.w),
        // floatingLabelBehavior: FloatingLabelBehavior.auto,
        contentPadding: EdgeInsets.fromLTRB(10.w, 16.h, 14.w, 20.h),
        // enabledBorder: const UnderlineInputBorder(
        //   borderSide: BorderSide(color: AppColors.primaryColor),
        // ),
        focusedBorder:  OutlineInputBorder(
          gapPadding: 5,
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: Color(0XFF707070),),
        ),
        border: OutlineInputBorder(

          gapPadding: 5,
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: Color(0XFF707070),),
        ),
        focusColor: Colors.black,
      ),
    );
  }
}
