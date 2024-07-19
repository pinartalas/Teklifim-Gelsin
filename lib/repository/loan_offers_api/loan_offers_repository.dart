import 'package:flutter/foundation.dart';
import 'package:teklifim_gelsin_task/data/network/BaseApiService.dart';
import 'package:teklifim_gelsin_task/data/network/NetworkApiService.dart';
import 'package:teklifim_gelsin_task/model/loan_model.dart';
import 'package:teklifim_gelsin_task/res/app_url.dart';

class LoanOffersRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<LoanModel> loanOffersApi(int amount, int maturity) async {
    try {
      dynamic response = await _apiService
          .getGetApiResponse(AppUrl.loanOffersUrl(amount, maturity));

      if (response is Map<String, dynamic>) {
        return LoanModel.fromJson(response);
      } else {
        throw Exception('Unexpected response type');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }
}
