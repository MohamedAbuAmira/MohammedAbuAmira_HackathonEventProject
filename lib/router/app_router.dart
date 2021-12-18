import 'package:elancer_hackathon/business_logic/categories_cubit/categories_cubit.dart';
import 'package:elancer_hackathon/business_logic/category_events_cubit/category_events_cubit.dart';
import 'package:elancer_hackathon/business_logic/product_cubic/product_cubit.dart';
import 'package:elancer_hackathon/core/exceptions/route_exception.dart';
import 'package:elancer_hackathon/data/models/category.dart';
import 'package:elancer_hackathon/data/models/event.dart';
import 'package:elancer_hackathon/data/repository/categories_repository.dart';
import 'package:elancer_hackathon/data/repository/event_detials_repository.dart';
import 'package:elancer_hackathon/data/repository/events_repository.dart';
import 'package:elancer_hackathon/data/web_service/categories_web_service.dart';
import 'package:elancer_hackathon/data/web_service/event_detials_web_service.dart';
import 'package:elancer_hackathon/data/web_service/events_web_service.dart';
import 'package:elancer_hackathon/screens/add_event.dart';
import 'package:elancer_hackathon/screens/events_screen.dart';
import 'package:elancer_hackathon/screens/event_detials.dart';
import 'package:elancer_hackathon/screens/home_screen.dart';
import 'package:elancer_hackathon/screens/login_screen.dart';
import 'package:elancer_hackathon/screens/luanch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static const String launch = 'launch_screen';
  static const String login = '/login_screen';
  static const String events = '/events_screen';
  static const String eventDetails = '/event_detials';
  static const String addEvent = '/add_event';

  static const String home = '/';

  ///////////////////////////////////////////////////////////////

  // AppRouter() {}

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case launch:
        return MaterialPageRoute(
          builder: (_) => const LaunchScreen(),
        );
      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case home:
        final categoryRepository = CategoryRepository(CategoriesWebService());
        final categoryCubit = CategoriesCubit(categoryRepository);

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (BuildContext contex) => categoryCubit,
              child: HomeScreen()),
        );
      case events:
        final argCategory = settings.arguments as Category;

        final categoryEventsRepository = CategoryEventsRepository(
            CategoryEventsWebService(categoryId: argCategory.id.toString()));
        final categoryEventsCubit =
            CategoryEventsCubit(categoryEventsRepository);

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (BuildContext contex) => categoryEventsCubit,
              child: EventsScreen(category: argCategory)),
        );

      case eventDetails:
        final argEvent = settings.arguments as Event;
        print(argEvent.id.toString());

        final eventDetialsRepository = EventDetialsRepository(
            EventDetialsWebService(eventId: argEvent.id.toString()));
        print(eventDetialsRepository.toString());
        final eventDetialsCubit = EventDetailsCubit(eventDetialsRepository);

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (BuildContext contex) => eventDetialsCubit,
              child: EventDetials(event: argEvent)),
        );
      case addEvent:
        return MaterialPageRoute(
          builder: (_) => AddEventScreen(),
        );

      default:
        throw const RouteException('Route not found!');
    }
  }
}
