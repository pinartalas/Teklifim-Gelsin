import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teklifim_gelsin_task/res/components/buton.dart';
import 'package:teklifim_gelsin_task/res/components/color.dart';
import 'package:teklifim_gelsin_task/utils/routes/routes_name.dart';
import 'package:teklifim_gelsin_task/view/search/widgets/amount_input_widget.dart';
import 'package:teklifim_gelsin_task/view/search/widgets/majority_input_widget.dart';
import 'package:teklifim_gelsin_task/view_model/search_view_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double containerHeight = screenHeight * 0.5;
    final searchViewModel = Provider.of<SearchViewModel>(context);
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          title: const Text(
            'Kredi Arama',
            style: TextStyle(fontSize: 22),
          ),
          centerTitle: true,
          backgroundColor: AppColors.whiteColor,
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
              height: containerHeight,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AmountInput(),
                    const SizedBox(height: 32.0),
                    MaturityInput(),
                    const SizedBox(height: 38.0),
                    RoundButton(
                      title: 'Teklifim Gelsin',
                      loading: searchViewModel.loading,
                      onPress: () async {
                        await searchViewModel.loanOffersApi();
                        Navigator.pushNamed(
                          context,
                          RoutesName.result,
                        );
                      },
                    )
                  ],
                ),
              )),
        )));
  }
}
