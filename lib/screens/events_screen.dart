import 'package:elancer_hackathon/business_logic/category_events_cubit/category_events_cubit.dart';
import 'package:elancer_hackathon/data/models/category.dart';
import 'package:elancer_hackathon/data/models/event.dart';
import 'package:elancer_hackathon/router/app_router.dart';
import 'package:elancer_hackathon/screens/widgets/picture_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key, required this.category}) : super(key: key);
  final Category category;

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final Event event = Event();
  late List events;
  void text() {
    event.name = "Cutting-Edges Technology";
    event.address = "San Fransisco";
    event.info = "About the last technology coming from Silicon Vally";
    event.durationHours = 5;
    event.imagesCount = 10;
    event.commentsCount = 10;
    event.date = "2021-12-20";
    event.time = "08:30Am";
    event.status = "Active";

    event.imageUrl =
        'https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80';

  }

  late List<Event> allEvents;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoryEventsCubit>(context).getAllCategoryEvents();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CategoryEventsCubit, CategoryEventsState>(
      builder: (context, state) {
        if (state is CategoryEventsLoaded) {
          allEvents = (state).categoryEvents;
          return _buildCategoryEventsCards();
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
    setState(() {
      events = [event, event, event, event];
    });
    text();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: Image.asset("assets/images/Group19420.png"),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset("assets/images/Rectangle.png"),
                CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 40,
                    child: Image.asset(
                      "assets/images/Group19144.png",
                      width: 85,
                      height: 85,

                    )),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
            SizedBox(height: 20.h),
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: _tabBarWithView(),
            ),
          ],
        ),
      ),
    );
  }

  ListView _buildCategoryEventsCards() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allEvents.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (ctx, index) {
        // return EventCard(event: events[index]);
        return EventCard(event: allEvents[index]);
      },
    );
  }

  Widget _tabBarWithView() {
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(

              // padding: ,
              // labelPadding: EdgeInsets.only(left: -5, right: 20.w),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding:
                  EdgeInsets.only(left: 0, top: 8.h, bottom: 15.h),
              isScrollable: true,
              indicatorColor: Color(0XFF253975),
              labelColor: Color(0XFF253975),
              labelStyle: TextStyle(
                  color: Color(0XFF11A38D),
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp),
              unselectedLabelColor: Color(0XFF3A3652),
              unselectedLabelStyle: TextStyle(
                  color: Color(0XFF11A38D),
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.normal,
                  fontSize: 13.sp),
              tabs: [
                Container(
                  width: 150,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Tab(
                      text: "Active",
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Tab(
                      text: "End",
                    ),
                  ),
                ),
              ]),
          SizedBox(
            height: 600.h,
            width: double.infinity,
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                buildBlocWidget(),
                Center(
                  child: Text(
                    'Not Yet',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp),
                  ),
                )
              ],
            ),
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
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
        onTap: () {
          Navigator.pushNamed(context, AppRouter.eventDetails,
              arguments: event);
        },
        leading: SizedBox(
          width: 100.w,
          height: 100.h,
          child: CustomPictureProvider(
            image: event.imageUrl,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${event.time.toString()} - ${event.durationHours.toString()}Hours",
              style: TextStyle(
                  color: Color(0XFF8E8B9D),
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.normal,
                  fontSize: 11.sp),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h, bottom: 5.h),
              child: Text(
                event.name,
                style: TextStyle(
                    color: Color(0XFF423E5B),
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp),
              ),
            ),
            Text(
              event.date,
              style: TextStyle(
                  color: Color(0XFF253975),
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.normal,
                  fontSize: 11.sp),
            )
          ],
        ),
        trailing: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: Color(0XFF11A38D).withOpacity(0.20),
          ),
          height: 20.h,
          width: 48.w,
          alignment: Alignment.center,
          child: Text(
            event.status,
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
