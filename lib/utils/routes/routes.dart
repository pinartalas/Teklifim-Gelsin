import 'package:flutter/material.dart';
import 'package:teklifim_gelsin_task/utils/routes/routes_name.dart';
import 'package:teklifim_gelsin_task/view/detail/detail_screen.dart';
import 'package:teklifim_gelsin_task/view/result/result_screen.dart';
import 'package:teklifim_gelsin_task/view/search/search_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.search:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SearchScreen());
      case RoutesName.result:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ResultScreen());
      case RoutesName.detail:
        return MaterialPageRoute(
            builder: (BuildContext context) => DetailScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
              body: Center(
            child: Text("No route defined"),
          ));
        });
    }
  }
}
