import 'package:elancer_hackathon/data/models/category.dart';
import 'package:elancer_hackathon/data/models/event.dart';
import 'package:elancer_hackathon/router/app_router.dart';
import 'package:elancer_hackathon/screens/widgets/picture_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key, required this.category}) : super(key: key);
  final Category category;

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final Event event = Event();
  void text() {
    event.name = "My first Event";
    event.address = "Gaza";
    event.info = "event info";
    event.durationHours = 5;

    event.image =
        'https://images.unsplash.com/photo-1639818019702-bba773c78923?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=455&q=80';
  }

  @override
  Widget build(BuildContext context) {
    text();
    return Scaffold(

      body: Column(
        children: [
          Stack(
            children: [
              Image.asset("assets/images/Rectangle.png"),
              SizedBox(
                height: 27.h,
              ),
              Positioned(
                  bottom: 10,
                  child: CircleAvatar(
                      child: Icon(
                    Icons.person,
                  )))
            ],
          ),
          Text(
            widget.category.nameEn,
            style: TextStyle(
                color: Color(0xFF3E3A57),
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
                fontSize: 22.sp),
          ),
          Text(
            widget.category.eventsCount.toString(),
            style: TextStyle(
                color: Color(0xFFFF4E62),
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
                fontSize: 22.sp),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: widget.category.eventsCount,
            scrollDirection: Axis.vertical,
            itemBuilder: (ctx, index) {
              return EventCard(event: event);
            },
          ),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, AppRouter.eventDetails,
              arguments: event);
        },
        leading: Container(
          width: 97.w,
          height: 80.h,
          child: PictureProvider(
            image: event.image,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "4654554",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.normal,
                  fontSize: 11.sp),
            ),
            Text(
              "Name",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp),
            ),
            Text(
              "fgf data",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.normal,
                  fontSize: 11.sp),
            )
          ],
        ),
        trailing: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Color(0XFF11A38D).withOpacity(0.50),
          ),
          height: 20.h,
          width: 48.w,
          alignment: Alignment.center,
          child: Text(
            "Active",
            style: TextStyle(
                color: Color(0XFF11A38D),
                fontFamily: "Roboto",
                fontWeight: FontWeight.normal,
                fontSize: 10.sp),
          ),
        ),
      ),
    );
  }
}
