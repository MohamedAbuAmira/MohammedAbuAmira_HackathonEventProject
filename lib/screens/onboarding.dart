import 'package:elancer_hackathon/data/models/slider_onboarding.dart';
import 'package:elancer_hackathon/router/app_router.dart';
import 'package:elancer_hackathon/screens/widgets/slider_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OboardingScreen extends StatefulWidget {
  const OboardingScreen({Key? key}) : super(key: key);

  @override
  _OboardingScreenState createState() => _OboardingScreenState();
}

class _OboardingScreenState extends State<OboardingScreen> {
  late PageController pageViewcontroller;
  List<SliderModel> slides = <SliderModel>[];
  late int currentIndex;
  @override
  void initState() {
    super.initState();
    // initilize when the screen open

    slides = getSlides();
    currentIndex = 0;
    pageViewcontroller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 600.h,
              width: double.infinity,
              child: PageView.builder(
                controller: pageViewcontroller,
                itemCount: slides.length,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  return SliderTile(
                      imgPath: slides[index].getImagePath(),
                      title: slides[index].getTitle(),
                      description: slides[index].getdescription());
                },
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < slides.length; i++)
                  currentIndex == i
                      ? _pageIndexIndicator(true)
                      : _pageIndexIndicator(false),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            currentIndex != slides.length - 1
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50.h,
                        width: double.infinity,

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.r)),
                        clipBehavior: Clip.antiAlias,
                        child: ElevatedButton(
                          onPressed: () {
                            pageViewcontroller.animateToPage(currentIndex + 1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linear);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0XFF2D3E74),
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp),
                          ),
                          child: const Text(
                            "Next",
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(
                    height: 50.h,
                    width: double.infinity,

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r)),
                    clipBehavior: Clip.antiAlias,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, AppRouter.home);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0XFF2D3E74),
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp),
                      ),
                      child: const Text(
                        "Start",
                      ),
                    ),
                  ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                      color: Color(0xFF423E5B),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.normal,
                      fontSize: 13.sp),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouter.login);
                  },
                  child: Text(
                    "Sing In",
                    style: TextStyle(
                        color: Color(0xFF253975),
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _pageIndexIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      height: isCurrentPage ? 10.h : 8.h,
      width: isCurrentPage ? 10.w : 8.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCurrentPage ? Color(0XFF2D3E74) : Color(0XFF707070),
      ),
    );
  }
}
