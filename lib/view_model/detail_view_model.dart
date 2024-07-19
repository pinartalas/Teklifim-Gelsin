import 'package:flutter/material.dart';
import 'package:teklifim_gelsin_task/model/loan_model.dart';

class DetailViewModel extends ChangeNotifier {
  final LoanModel offer;

  DetailViewModel({required this.offer});
}
