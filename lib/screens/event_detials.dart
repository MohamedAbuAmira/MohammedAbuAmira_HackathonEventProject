import 'package:elancer_hackathon/business_logic/product_cubic/product_cubit.dart';
import 'package:elancer_hackathon/data/models/event.dart';
import 'package:elancer_hackathon/screens/widgets/picture_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.white,
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
      body: buildBlocWidget(),
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
              child: PictureProvider(
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
                    Image.asset(
                      "assets/images/share.png",
                      width: 10.w,
                      height: 10.h,
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
                    Image.asset(
                      "assets/images/alarm_on_black_24dp.png",
                      width: 10.w,
                      height: 10.h,
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                event.time.toString(),
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.normal,
                    fontSize: 11.sp),
              ),
              Text(
                event.date.toString(),
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp),
              ),
              Text(
                event.imagesCount.toString(),
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.normal,
                    fontSize: 11.sp),
              ),
            ],
          ),
          Text(
            "Location",
            style: TextStyle(
                color: Color(0XFF403B58),
                fontFamily: "Roboto",
                fontWeight: FontWeight.normal,
                fontSize: 12.sp),
          ),
          Text(
            event.address,
            style: TextStyle(
                color: Color(0XFF807C94),
                fontFamily: "Roboto",
                fontWeight: FontWeight.normal,
                fontSize: 12.sp),
          ),
          Text(
            "Info",
            style: TextStyle(
                color: Color(0XFF403B58),
                fontFamily: "Roboto",
                fontWeight: FontWeight.normal,
                fontSize: 12.sp),
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
          )
        ],
      ),
    );
  }
}
