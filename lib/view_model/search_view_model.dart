import 'package:flutter/foundation.dart';
import 'package:teklifim_gelsin_task/model/loan_model.dart';
import 'package:teklifim_gelsin_task/repository/loan_offers_api/loan_offers_repository.dart';

class SearchViewModel extends ChangeNotifier {
  final LoanOffersRepository _repo = LoanOffersRepository();
  LoanModel? loanModel;

  bool _loading = false;
  bool get loading => _loading;

  //the amount and the maturit
  int _amount = 0;
  int _maturity = 0;

  int get amount => _amount;
  int get maturity => _maturity;

  void setAmount(int amount) {
    _amount = amount;
    notifyListeners();
  }

  void setMaturity(int maturity) {
    _maturity = maturity;
    notifyListeners();
  }

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loanOffersApi() async {
    try {
      setLoading(true);
      loanModel = await _repo.loanOffersApi(_amount, _maturity);
      if (kDebugMode) {
        print(loanModel.toString());
      }
      setLoading(false);
      if (kDebugMode) {
        print(loanModel);
      }
    } catch (error) {
      setLoading(false);

      if (kDebugMode) {
        print(error.toString());
      }
    }
  }
}
