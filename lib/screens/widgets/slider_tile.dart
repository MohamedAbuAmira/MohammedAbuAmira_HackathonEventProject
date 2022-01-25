import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SliderTile extends StatelessWidget {
  final String imgPath;
  final String title;
  final String description;
  const SliderTile({
    Key? key,
    required this.imgPath,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imgPath,
            height: 410.h,
            width: 280.w,
          ),
          SizedBox(
            height: 47.h,
          ),
          Text(
            title,
            style: TextStyle(
                color: Color(0xFF040404),
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
                fontSize: 20.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            description,
            style: TextStyle(
                color: Color(0xFF707070),
                fontFamily: "Roboto",
                fontWeight: FontWeight.normal,
                fontSize: 16.sp),

            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}