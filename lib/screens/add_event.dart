import 'package:elancer_hackathon/screens/widgets/defualt_button.dart';
import 'package:elancer_hackathon/screens/widgets/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({Key? key}) : super(key: key);

  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  late TextEditingController _NameTextController;

  late TextEditingController _dateTextcontroller;
  late TextEditingController _timeTextcontroller;

  late TextEditingController _hoursTextcontroller;
  late TextEditingController _categoryTextcontroller;

  late TextEditingController _locationTextcontroller;
  late TextEditingController _infoTextcontroller;
  @override
  void initState() {
    super.initState();
    _NameTextController = TextEditingController();
    _dateTextcontroller = TextEditingController();
    _timeTextcontroller = TextEditingController();
    _hoursTextcontroller = TextEditingController();
    _categoryTextcontroller = TextEditingController();
    _locationTextcontroller = TextEditingController();
    _infoTextcontroller = TextEditingController();
  }

  @override
  void dispose() {
    _NameTextController.dispose();
    _dateTextcontroller.dispose();
    _timeTextcontroller.dispose();
    _hoursTextcontroller.dispose();
    _categoryTextcontroller.dispose();
    _locationTextcontroller.dispose();
    _infoTextcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add Event",
          style: TextStyle(
              color: Color(0xFF403B58),
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold,
              fontSize: 15.sp),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Text(
                    'Name',
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.normal,
                        fontSize: 15.sp),
                  ),
                ),
                InputTextField(
                  controller: _NameTextController,
                  hintText: "Enter your PName",
                  labelText: "Name",
                  textInputType: TextInputType.name,
                ),
                SizedBox(height: 25.h),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date',
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15.sp),
                            ),
                            InputTextField(
                              controller: _dateTextcontroller,
                              hintText: "Enter Date",
                              labelText: "Date",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Time',
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15.sp),
                            ),
                            InputTextField(
                              controller: _timeTextcontroller,
                              hintText: "Enter Time",
                              labelText: "Time",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Text(
                    'Hours',
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.normal,
                        fontSize: 15.sp),
                  ),
                ),
                InputTextField(
                  controller: _hoursTextcontroller,
                  hintText: "Hours",
                  labelText: "Hours",
                  textInputType: TextInputType.name,
                ),
                SizedBox(height: 25.h),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Text(
                    'Category',
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.normal,
                        fontSize: 15.sp),
                  ),
                ),
                InputTextField(
                  controller: _categoryTextcontroller,
                  hintText: "Category",
                  labelText: "Category",
                  textInputType: TextInputType.name,
                ),
                SizedBox(height: 25.h),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Text(
                    'Location',
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.normal,
                        fontSize: 15.sp),
                  ),
                ),
                InputTextField(
                  controller: _locationTextcontroller,
                  hintText: "Location",
                  labelText: "Location",
                  textInputType: TextInputType.name,
                ),
                SizedBox(height: 25.h),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Text(
                    'Info',
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.normal,
                        fontSize: 15.sp),
                  ),
                ),
                InputTextField(
                  controller: _infoTextcontroller,
                  hintText: "Information",
                  labelText: "Enter The Event Information",
                  textInputType: TextInputType.name,
                ),
                SizedBox(height: 25.h),
                // DefaultButton(
                //     press: () async => await performLogin(), text: "Log In"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
