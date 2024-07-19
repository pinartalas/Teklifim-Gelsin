import 'package:flutter/foundation.dart';
import 'package:teklifim_gelsin_task/model/loan_model.dart';
import 'package:teklifim_gelsin_task/repository/loan_offers_api/loan_offers_repository.dart';

class ResultViewModel extends ChangeNotifier {
  final LoanOffersRepository _repo = LoanOffersRepository();
  LoanModel? loanModel;
  ActiveOffers? _selectedOffer;
  SponsoredOffers? _selectedSponsor;

  bool _loading = false;

  bool get loading => _loading;
  LoanModel? get offers => loanModel;
  ActiveOffers? get selectedOffer => _selectedOffer;
  SponsoredOffers? get selectedSponsor => _selectedSponsor;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> fetchLoanOffers(int amount, int maturity) async {
    try {
      setLoading(true);
      loanModel = await _repo.loanOffersApi(amount, maturity);
      setLoading(false);
    } catch (error) {
      setLoading(false);
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  void selectOffer(ActiveOffers offer) {
    _selectedOffer = offer;
    notifyListeners();
  }

  void selectSponsor(SponsoredOffers offer) {
    _selectedSponsor = offer;
    notifyListeners();
  }
}
