import 'package:elancer_hackathon/data/models/category.dart';
import 'package:elancer_hackathon/router/app_router.dart';
import 'package:elancer_hackathon/screens/widgets/picture_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryEventsViewer extends StatelessWidget {
  const CategoryEventsViewer({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: categories.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (ctx, index) {
        return CategoryItem(category: categories[index]);
      },
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.events, arguments: category);
      },
      child: Container(

        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: Color(0xFFECECEF),
          ),
        ),


        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(

            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  SizedBox(
                    child: CustomPictureProvider(image: category.image),
                    height: 130.h,
                    width: 130.w,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(bottom: 10.h, left: 8.w),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Color(0xFF707070).withOpacity(0.80),
                      ),
                      width: 80.w,
                      height: 20.h,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 6.w),
                            child: Image.asset(
                              "assets/images/share.png",
                              width: 10.w,
                              height: 10.h,
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: 5.w),
                            child: Text(

                              '${category.eventsCount.toString()} Events',

                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Cairo",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Text(
                  category.nameEn,
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
