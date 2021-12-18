import 'package:elancer_hackathon/business_logic/category_events_cubit/category_events_cubit.dart';
import 'package:elancer_hackathon/data/models/category.dart';
import 'package:elancer_hackathon/data/models/event.dart';
import 'package:elancer_hackathon/router/app_router.dart';
import 'package:elancer_hackathon/screens/widgets/picture_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key, required this.category}) : super(key: key);
  final Category category;

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final Event event = Event();
  void text() {
    event.name = "My first Event";
    event.address = "Gaza";
    event.info = "event info";
    event.durationHours = 5;

    event.image =
        'https://images.unsplash.com/photo-1639818019702-bba773c78923?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=455&q=80';
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
    text();
    return Scaffold(


      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_outlined, color: Colors.black,), onPressed: (){Navigator.pop(context);}),
        backgroundColor: Colors.white,),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 10.h),
                child: Image.asset("assets/images/Rectangle.png"),
              ),
              CircleAvatar(
                radius: 43.r,
                child: Icon(
                  Icons.person,
                ),
              ),
              SizedBox(
                height: 27.h,
              ),

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
          buildBlocWidget(),
        ],
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
        return EventCard(event: allEvents[index]);
      },
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
        contentPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        onTap: () {
          Navigator.pushNamed(context, AppRouter.eventDetails,
              arguments: event);
        },
        leading: Container(
          width: 97.w,
          height: 80.h,
          child: PictureProvider(
            image: event.imageUrl,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${event.time.toString()} - ${event.durationHours.toString()}Hours",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.normal,
                  fontSize: 11.sp),
            ),
            Text(
              event.name,
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp),
            ),
            Text(
              event.date,
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
