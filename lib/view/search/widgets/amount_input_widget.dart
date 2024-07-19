import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teklifim_gelsin_task/view_model/search_view_model.dart';

class AmountInput extends StatelessWidget {
  const AmountInput({super.key});

  @override
  Widget build(BuildContext context) {
    final searchViewModel =
        Provider.of<SearchViewModel>(context, listen: false);

    return Consumer<SearchViewModel>(
      builder: (context, viewModel, child) {
        return TextField(
          decoration: InputDecoration(
            labelText: 'Tutar',
            alignLabelWithHint: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            final amount = int.tryParse(value) ?? 0;
            searchViewModel.setAmount(amount);
          },
        );
      },
    );
  }
}
