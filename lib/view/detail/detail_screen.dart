import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teklifim_gelsin_task/res/components/buton.dart';
import 'package:teklifim_gelsin_task/res/components/color.dart';
import 'package:teklifim_gelsin_task/view/detail/widgets/rowWidget.dart';
import 'package:teklifim_gelsin_task/view_model/result_view_model.dart';
import 'package:teklifim_gelsin_task/view_model/search_view_model.dart';

import '../../utils/calculate_monthly_payment.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ResultViewModel'den verileri al
    final resultViewModel = Provider.of<ResultViewModel>(context);
    final searchViewModel = Provider.of<SearchViewModel>(context);

    // Seçilen teklifi al
    final offer = resultViewModel.selectedOffer;
    final amount = searchViewModel.amount;
    final maturity = searchViewModel.maturity;

    if (offer == null) {
      return AlertDialog(
        title: const Text('Hata'),
        content: const Text('Seçilen teklif bilgisi bulunamadı.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Kapat'),
          ),
        ],
      );
    }
    // calculate monthly payment
    int monthlyPayment = calculateMonthlyPayment(
      amount,
      offer.annualRate ?? 0.0,
      maturity,
    );

    return AlertDialog(
      backgroundColor: AppColors.whiteColor,
      title: const Text('Başvuru Detayları'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          rowWidget(title: "Banka: ", data: offer.bank ?? 'Bilinmiyor'),
          rowWidget(
              title: "Yıllık Oran: ",
              data: offer.annualRate?.toStringAsFixed(2) ?? 'Bilinmiyor'),
          rowWidget(title: "Faiz Oranı: ", data: offer.interestRate.toString()),
          rowWidget(title: "Kredi Tutarı: ", data: amount.toString()),
          rowWidget(title: "Vade Süresi: ", data: maturity.toString()),
          rowWidget(title: "Aylık Ödeme: ", data: monthlyPayment.toString()),
        ],
      ),
      actions: [
        Center(child: RoundButton(title: "Hemen Başvur", onPress: () {}))
      ],
    );
  }
}
