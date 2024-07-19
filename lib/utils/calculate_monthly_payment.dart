import 'dart:math';

int calculateMonthlyPayment(int amount, double annualRate, int maturity) {
  double totalInterestRate = annualRate * 0.013; // Correct rate calculation
  double totalPower = pow(1 + totalInterestRate, maturity) as double;
  double monthlyPayment =
      (amount * totalInterestRate * totalPower) / (totalPower - 1);
  return monthlyPayment.round(); // Rounds the result to the nearest integer
}
