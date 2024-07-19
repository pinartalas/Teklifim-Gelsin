class AppUrl {
  static String loanOffersUrl(int amount, int maturity) {
    return 'https://api2.teklifimgelsin.com/api/getLoanOffers?kredi_tipi=0&vade=$maturity&tutar=$amount/application/json';
  }
}
