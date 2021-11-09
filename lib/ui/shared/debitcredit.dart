import 'package:tall/core/services/string_format.dart';

debitCredit(double inputNumber) {
  if (inputNumber != null) {
    if (inputNumber < 0) {
      return '${formatIndianCurrency(inputNumber.toString().substring(1, inputNumber.toString().length))} Dr.';
    } else {
      return '${formatIndianCurrency(inputNumber.toString())} Cr.';
    }
  } else {
    return inputNumber;
  }
}
