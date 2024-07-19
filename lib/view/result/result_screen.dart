import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teklifim_gelsin_task/res/components/color.dart';
import 'package:teklifim_gelsin_task/res/components/iconButton.dart';
import 'package:teklifim_gelsin_task/view/result/widgets/active_offer_card.dart';
import 'package:teklifim_gelsin_task/view/result/widgets/sponsored_offered.dart';
import 'package:teklifim_gelsin_task/view_model/result_view_model.dart';
import 'package:teklifim_gelsin_task/view_model/search_view_model.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchViewModel = Provider.of<SearchViewModel>(context);

    final amount = searchViewModel.amount;
    final maturity = searchViewModel.maturity;

    return ChangeNotifierProvider<ResultViewModel>(
      create: (_) => ResultViewModel()..fetchLoanOffers(amount, maturity),
      child: Consumer<ResultViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.offers == null) {
            return const Center(child: Text('Sonuç bulunamadı.'));
          }

          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: AppBar(
              backgroundColor: AppColors.whiteColor,
              title: const Text('Teklifler', style: TextStyle(fontSize: 22)),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('TL $amount | $maturity Ay',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      ButtonWithIcon(
                        onPressed: () => Navigator.pop(context),
                        text: 'Aramayı Güncelle',
                        icon: Icons.edit,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      // Existing activeOffers section
                      ...viewModel.offers?.activeOffers?.map((offer) {
                            return ActiveOfferCard(
                              offer: offer,
                              viewModel: viewModel,
                            );
                          }) ??
                          [],

                      // New ExpansionTile for sponsoredOffers
                      ExpansionTile(
                        title: const Text(
                          'Sponsorlu Teklifler',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        children: [
                          ...?viewModel.offers?.sponsoredOffers?.where((offer) {
                            //If at least one of the data is not null, the card is displayed.
                            return offer.adName != null ||
                                offer.adContent != null ||
                                offer.footnote != null;
                          }).map((offer) {
                            return SponsoredOfferCard(
                              offer: offer,
                              viewModel: viewModel,
                            );
                          }).toList(),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
