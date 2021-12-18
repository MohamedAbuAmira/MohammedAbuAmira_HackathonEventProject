
import 'package:elancer_hackathon/business_logic/categories_cubit/categories_cubit.dart';
import 'package:elancer_hackathon/router/app_router.dart';
import 'package:elancer_hackathon/screens/widgets/category_events_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elancer_hackathon/data/models/category.dart';
import 'package:flutter_svg/svg.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Category> allCategories;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoriesCubit>(context).getAllCategories();
  }
  final Category category = Category();
  void text(){
    category.nameEn = "My first category";
    category.eventsCount = 4;
    category.image = 'https://images.unsplash.com/photo-1639818019702-bba773c78923?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=455&q=80';
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoaded) {
          allCategories = (state).categories;
          return _buildCategoriesEventsListView();
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

        backgroundColor: Colors.white,
        actions: [IconButton(onPressed: (){Navigator.pushNamed(context, AppRouter.addEvent);}, icon: SvgPicture.asset("assets/images/Notifications.svg"))],
        title: Text(
          "Categories",
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

  Widget _buildCategoriesEventsListView() => Padding(
    padding:  EdgeInsets.symmetric(horizontal: 12.w),
    child: CategoryEventsViewer(categories: allCategories,),
  );
}
