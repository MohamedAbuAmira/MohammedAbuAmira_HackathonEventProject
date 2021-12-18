import 'package:elancer_hackathon/core/helpers/helpers.dart';
import 'package:elancer_hackathon/data/web_service/user_web_service.dart';
import 'package:elancer_hackathon/router/app_router.dart';
import 'package:elancer_hackathon/screens/widgets/defualt_button.dart';
import 'package:elancer_hackathon/screens/widgets/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/UCASEvents.png'),
                  ),
                  SizedBox(height: 50.h),
                  Text(
                    'Welcome to back',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: "Cairo",
                        fontWeight: FontWeight.bold,
                        fontSize: 11.sp),
                  ),
                  SizedBox(height: 10.h),
                  Text('Login with',
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: Color(0XFF253975),
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.normal,
                          fontSize: 22.sp)),
                  SizedBox(height: 30.h),
                  const LoginInForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginInForm extends StatefulWidget {
  const LoginInForm({Key? key}) : super(key: key);

  @override
  _LoginInFormState createState() => _LoginInFormState();
}

class _LoginInFormState extends State<LoginInForm> with Helpers {
  late TextEditingController _phoneNumberTextController;
  late TextEditingController _passwordTextcontroller;

  @override
  void initState() {
    super.initState();
    _phoneNumberTextController = TextEditingController();
    _passwordTextcontroller = TextEditingController();
  }

  @override
  void dispose() {
    _phoneNumberTextController.dispose();
    _passwordTextcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(bottom: 10.h),
          child: Text(
            'Phone',

            style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.normal,
                fontSize: 15.sp),
          ),
        ),
        InputTextField(
          controller: _phoneNumberTextController,
          hintText: "Enter your Phone Number",
          labelText: "Phone Number",
          textInputType: TextInputType.phone,
        ),
        SizedBox(height: 25.h),
        Padding(
          padding:  EdgeInsets.only(bottom: 10.h),
          child: Text(
            'Password',

            style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.normal,
                fontSize: 15.sp),
          ),
        ),
        InputTextField(
          controller: _passwordTextcontroller,
          hintText: "Enter your Password",
          labelText: "Password",


          suffixIcon: Icon(Icons.remove_red_eye_outlined),
          obscureText: true,
        ),
        SizedBox(
          height: 20.h,
        ),
        DefaultButton(press: () async => await performLogin(), text: "Log In"),
      ],
    );
  }

  Future<void> performLogin() async {
    if (chechData()) {
      return login();
    }
  }

  bool chechData() {
    if (_phoneNumberTextController.text.isNotEmpty &&
        _passwordTextcontroller.text.isNotEmpty) {
      return true;
    } else {
      showSnackBar(
        context: context,
        message: 'Enter required data!',
        error: true,
      );
      return false;
    }
  }

  Future<void> login() async {
    final Map<String, String> loginDetails = {};
    loginDetails['mobile'] = _phoneNumberTextController.text;
    loginDetails['password'] = _passwordTextcontroller.text;
    Map authBaseResponse =
        await UserWebService().login(context, loginDetails: loginDetails);
    if (authBaseResponse['status']) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, AppRouter.home);
      });
    } else {}
  }
}
