import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teklifim_gelsin_task/res/components/buton.dart';
import 'package:teklifim_gelsin_task/res/components/color.dart';
import 'package:teklifim_gelsin_task/view_model/result_view_model.dart';

class DetailSupportScreen extends StatelessWidget {
  const DetailSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ResultViewModel'den verileri al
    final resultViewModel = Provider.of<ResultViewModel>(context);

    // Seçilen teklifi al
    final offer = resultViewModel.selectedSponsor;
    List<String>? words = offer!.adDetails?.split(' ');
    String? truncatedText = words!.length <= 50
        ? offer.adDetails
        : '${words.take(50).join(' ')}...';

    return AlertDialog(
      backgroundColor: AppColors.whiteColor,
      title: Text(offer.adName!,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            offer.adContent ?? '',
          ),
          Text(truncatedText!)
        ],
      ),
      actions: [
        Center(child: RoundButton(title: "Hemen Başvur", onPress: () {}))
      ],
    );
  }
}
