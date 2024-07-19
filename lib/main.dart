import 'package:flutter/material.dart';
import 'package:teklifim_gelsin_task/res/components/color.dart';
import 'package:teklifim_gelsin_task/utils/routes/routes.dart';
import 'package:teklifim_gelsin_task/utils/routes/routes_name.dart';
import 'package:teklifim_gelsin_task/view_model/search_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchViewModel()),
      ],
      child: MaterialApp(
        title: 'Teklifim Gelsin',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.mainColor,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.search,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
