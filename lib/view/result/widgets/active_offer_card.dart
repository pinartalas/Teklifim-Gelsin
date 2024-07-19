import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teklifim_gelsin_task/model/loan_model.dart';
import 'package:teklifim_gelsin_task/res/components/buton.dart';
import 'package:teklifim_gelsin_task/res/components/color.dart';
import 'package:teklifim_gelsin_task/view/detail/detail_screen.dart';
import 'package:teklifim_gelsin_task/view/result/widgets/info_widget.dart';
import 'package:teklifim_gelsin_task/view_model/result_view_model.dart';

class ActiveOfferCard extends StatelessWidget {
  final ActiveOffers offer;
  final ResultViewModel viewModel;

  const ActiveOfferCard({
    Key? key,
    required this.offer,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Center(
                        child: Text('${offer.bank}',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor)),
                      ),
                    ],
                  ),
                ),
                CustomExpandedColumn(
                    text1: 'Yıllık Oran',
                    text2: offer.annualRate!.toStringAsFixed(2)),
                CustomExpandedColumn(
                    text1: 'Faiz Oranı', text2: offer.interestRate.toString()),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: AppColors.greyColor,
              thickness: 1,
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: RoundButton(
                    title: 'Hemen Başvur',
                    onPress: () {
                      viewModel.selectOffer(offer);

                      // `DetailScreen` içinde `ResultViewModel`'i sağlayın
                      showDialog(
                        context: context,
                        builder: (context) {
                          return ChangeNotifierProvider.value(
                            value: viewModel,
                            child: DetailScreen(),
                          );
                        },
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
