import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teklifim_gelsin_task/utils/routes/routes_name.dart';
import 'package:teklifim_gelsin_task/view_model/splash_view_model.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<SplashViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return CircularProgressIndicator();
            } else {
              Future.microtask(() {
                Navigator.pushNamed(context, RoutesName.search);
              });
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
