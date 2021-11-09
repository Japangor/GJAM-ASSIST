import 'package:flutter/material.dart';
import 'package:tall/core/models/ledger.dart';
import 'package:intl/intl.dart';
import 'package:tall/ui/widgets/childdetailcard.dart';
import 'package:tall/ui/widgets/detailcard.dart';
import 'package:tall/core/services/string_format.dart';
import 'package:tall/ui/widgets/partyscreen/ledgercard.dart';
import 'package:tall/ui/shared/debitcredit.dart';
import 'package:tall/ui/shared/positiveamount.dart';

var formatter = new DateFormat('dd-MM-yyyy');

_formatDate(DateTime date) {
  if (date != null) {
    return formatter.format(date);
  } else {
    return 'NA';
  }
}

class LedgerItemTileNew extends StatelessWidget {
  final LedgerItem ledgerItem;

  LedgerItemTileNew({this.ledgerItem});

  @override
  Widget build(BuildContext context) {
    if (ledgerItem.primaryGroupType == 'Sundry Debtors') {
      return LedgerCard(
        childdetailCard: ChildDetailCard(
            ledgerItem.name,
            '# ${ledgerItem.masterId}',
            ledgerItem.state ?? '',
            'Sales: ${formatIndianCurrency(ledgerItem.totalSales.toString())}',
            'Receipt: ${formatIndianCurrency(ledgerItem.totalReceipt.toString())}'),
        title1: 'Receivables',
        info1: formatIndianCurrency(
            positiveAmount(ledgerItem.closingBalance).toString()),
        title2: 'Last Sale ',
        info2: _formatDate(ledgerItem.lastSalesDate),
        title3: 'Last Receipt', info3: _formatDate(ledgerItem.lastReceiptDate),
        // title4: 'Top Item', info4: 'Coming Soon!',
        ledgerItem: ledgerItem,
      );
    } else {
      if (ledgerItem.primaryGroupType == 'Sundry Creditors') {
        return LedgerCard(
          childdetailCard: ChildDetailCard(
              ledgerItem.name,
              '# ${ledgerItem.masterId}',
              ledgerItem.restatCompanyCode.toString(),
              'Purchase: ${formatIndianCurrency(ledgerItem.totalPurchase.toString())}',
              'Payment: ${formatIndianCurrency(ledgerItem.totalPayment.toString())}'),
          title1: 'Payables',
          info1: formatIndianCurrency(ledgerItem.closingBalance.toString()),
          title2: 'Last Purchase ',
          info2: _formatDate(ledgerItem.lastPurchaseDate),
          title3: 'Last Payment',
          info3: _formatDate(ledgerItem.lastPaymentDate),
          // title4: 'Top Item', info4: 'Coming Soon!',
          ledgerItem: ledgerItem,
        );
      } else {
        return DetailCard(
            ledgerItem.name,
            '# ${ledgerItem.masterId}',
            ledgerItem.restatCompanyCode.toString(),
            'Closing: ${debitCredit(ledgerItem.closingBalance)}',
            'Opening: ${debitCredit(ledgerItem.openingBalance)}');
      }
    }
  }
}
