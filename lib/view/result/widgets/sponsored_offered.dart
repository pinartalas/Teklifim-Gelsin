import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teklifim_gelsin_task/model/loan_model.dart';
import 'package:teklifim_gelsin_task/res/components/buton.dart';
import 'package:teklifim_gelsin_task/res/components/color.dart';
import 'package:teklifim_gelsin_task/view/detail/detail_support_screen.dart';
import 'package:teklifim_gelsin_task/view_model/result_view_model.dart';

class SponsoredOfferCard extends StatelessWidget {
  final SponsoredOffers offer;
  final ResultViewModel viewModel;

  const SponsoredOfferCard({
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (offer.adName != null)
              Text(
                '${offer.adName}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor,
                ),
              ),
            if (offer.adContent != null)
              Text(
                '${offer.adContent}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackColor,
                ),
              ),
            if (offer.footnote != null)
              Text(
                '${offer.footnote}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: AppColors.blackColor,
                ),
              ),

            // Spacer to push the button to the bottom
            const SizedBox(height: 20),

            // Divider
            const Divider(
              color: AppColors.greyColor,
              thickness: 1,
              height: 20,
            ),

            // Bottom button
            Center(
              child: RoundButton(
                title: 'Detay',
                onPress: () {
                  viewModel.selectSponsor(offer);

                  // Display DetailScreen
                  showDialog(
                    context: context,
                    builder: (context) {
                      return ChangeNotifierProvider.value(
                        value: viewModel,
                        child: const DetailSupportScreen(),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
