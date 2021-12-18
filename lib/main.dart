

import 'package:elancer_hackathon/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/prefs/shared_pref_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Do
  await SharedPrefController().initSharedPref();
  // End
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => MaterialApp(

        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.launch,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
