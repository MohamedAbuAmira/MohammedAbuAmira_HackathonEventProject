import 'package:elancer_hackathon/business_logic/product_cubic/product_cubit.dart';
import 'package:elancer_hackathon/data/models/event.dart';
import 'package:elancer_hackathon/screens/widgets/picture_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventDetials extends StatefulWidget {
  const EventDetials({Key? key, required this.event}) : super(key: key);
  final Event event;

  @override
  _EventDetialsState createState() => _EventDetialsState();
}

class _EventDetialsState extends State<EventDetials> {
  late Event event;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<EventDetailsCubit>(context).getEventDetials();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<EventDetailsCubit, EventDetailsState>(
      builder: (context, state) {
        if (state is EventDetailsLoaded) {
          event = (state).event;
          return _buildEventDetials();
        } else {
          return showloadingLoaded();
        }
      },
    );
  }

  Widget showloadingLoaded() {
    return const Center(
      child: CircularProgressIndicator(color: Colors.blueAccent),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: SvgPicture.asset("assets/images/maps_ugc_black_24dp.svg"),
              onPressed: () {}),
          IconButton(
              icon: SvgPicture.asset(
                  "assets/images/linked_camera_black_24dp.svg"),
              onPressed: () {}),
        ],
        leading: IconButton(
            icon: Image.asset("assets/images/Group19420.png"),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.event.name,
          style: TextStyle(
              color: Color(0xFF403B58),
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold,
              fontSize: 15.sp),
        ),
      ),
      body: SingleChildScrollView(child: buildBlocWidget()),
    );
  }

  Padding _buildEventDetials() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Container(
              child: CustomPictureProvider(
                image: event.imageUrl,
              ),
              height: 250.h,
            ),
            Positioned(
              left: 21.w,
              bottom: 37.h,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Color(0xFF707070).withOpacity(0.30),
                ),
                width: 80.w,
                height: 20.h,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 5.w, right: 5.w),
                      child: Image.asset(
                        "assets/images/alarm_on_black_24dp.png",
                        width: 10.w,
                        height: 10.h,
                      ),
                    ),
                    Text(
                      '${event.durationHours.toString()} Hrs',
                      style: TextStyle(
                          color: Color(0XFF55516B),
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.normal,
                          fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 21.w,
              bottom: 10.h,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Color(0xFF707070).withOpacity(0.30),
                ),
                width: 80.w,
                height: 20.h,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 5.w, right: 5.w),
                      child: SvgPicture.asset(
                        "assets/images/Group19085.svg",
                        width: 10.w,
                        height: 10.h,
                      ),
                    ),
                    Text(
                      "Now",
                      style: TextStyle(
                          color: Color(0XFF55516B),
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.normal,
                          fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
            ),
          ]),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Text(
              event.name,
              style: TextStyle(
                  color: Color(0xFF403B58),
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset("assets/images/schedule_black_24dp.svg"),
              Padding(
                padding: EdgeInsets.only(left: 5.w, right: 30.w),
                child: Text(
                  event.time.toString(),
                  style: TextStyle(
                      color: Color(0XFF8E8B9D),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.normal,
                      fontSize: 11.sp),
                ),
              ),
              SvgPicture.asset("assets/images/event_black_24dp.svg"),
              Padding(
                padding: EdgeInsets.only(left: 5.w, right: 30.w),
                child: Text(
                  event.date.toString(),
                  style: TextStyle(
                      color: Color(0XFF8E8B9D),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp),
                ),
              ),
              SvgPicture.asset("assets/images/photo_library_black_24dp.svg"),
              Padding(
                padding: EdgeInsets.only(left: 5.w, right: 30.w),
                child: Text(
                  event.imagesCount.toString(),
                  style: TextStyle(
                      color: Color(0XFF8E8B9D),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.normal,
                      fontSize: 11.sp),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 14.h,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 7.w),
                child: SvgPicture.asset("assets/images/place_black_24dp.svg"),
              ),
              Text(
                "Location",
                style: TextStyle(
                    color: Color(0XFF403B58),
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.normal,
                    fontSize: 12.sp),
              ),
            ],
          ),
          Text(
            event.address,
            style: TextStyle(
                color: Color(0XFF807C94),
                fontFamily: "Roboto",
                fontWeight: FontWeight.normal,
                fontSize: 12.sp),
          ),
          SizedBox(
            height: 14.h,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 7.w),
                child: Image.asset("assets/images/info_black_24dp.png"),
              ),
              Text(
                "Info",
                style: TextStyle(
                    color: Color(0XFF403B58),
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.normal,
                    fontSize: 12.sp),
              ),
            ],
          ),
          Text(
            event.info,
            style: TextStyle(
                color: Color(0XFF807C94),
                fontFamily: "Roboto",
                fontWeight: FontWeight.normal,
                fontSize: 12.sp),
          ),
          Divider(
            color: Color(0XFF807C94),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Comments(23)",
                style: TextStyle(
                    color: Color(0xFF403B58),
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See All",
                  style: TextStyle(
                      color: Color(0xFF807C94),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.normal,
                      fontSize: 12.sp),
                ),
              ),
            ],
          ),
          Divider(
            color: Color(0XFF807C94),
          ),
          _userComment(),
          _userComment(),
          _userComment(),

        ],
      ),
    );
  }

  Widget _userComment() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.r)),
      child: Card(
       clipBehavior: Clip.antiAlias,
        child: ListTile(

          contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 40,
            child: SvgPicture.asset(
              "assets/images/user_place_holder.svg",
              width: 85,
              height: 85,
              clipBehavior: Clip.antiAlias,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Slava John",
                style: TextStyle(
                    color: Color(0XFF8E8B9D),
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.normal,
                    fontSize: 11.sp),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.h, bottom: 5.h),
                child: Text(
                  "Comment Appear Here",
                  style: TextStyle(
                      color: Color(0XFF423E5B),
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp),
                ),
              ),
              Text(
                "12/12/2020   - 12:18am",
                style: TextStyle(
                    color: Color(0XFF253975),
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.normal,
                    fontSize: 11.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
