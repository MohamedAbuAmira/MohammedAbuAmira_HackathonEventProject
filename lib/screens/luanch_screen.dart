import 'package:elancer_hackathon/core/prefs/shared_pref_controller.dart';
import 'package:elancer_hackathon/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      String ruote =
          SharedPrefController().loggedIn ? AppRouter.home : AppRouter.onboarding;
      Navigator.pushReplacementNamed(context, ruote);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0XFF253975),
        padding: const EdgeInsets.symmetric(horizontal: 80.0),
        alignment: Alignment.center,
        child: Image.asset('assets/images/Events.png'),
      ),
    );
  }
}
