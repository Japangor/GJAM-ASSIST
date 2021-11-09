import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tall/core/models/vouchers.dart';
import 'package:tall/core/services/timeperiod_filter_service.dart';
import 'package:tall/theme/dimensions.dart';
import 'package:tall/ui/widgets/detailcard.dart';
import 'package:intl/intl.dart';
import 'package:tall/core/services/string_format.dart';
import 'package:tall/ui/shared/positiveamount.dart';

var formatter = new DateFormat('dd-MM-yyyy');

_formatDate(DateTime date) {
  if (date != null) {
    return formatter.format(date);
  } else {
    return 'NA';
  }
}

class PaymentVoucherScreen extends StatelessWidget {
  PaymentVoucherScreen({this.timePeriod});

  final String timePeriod;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        PaymentVoucherList(
          timePeriod: timePeriod,
        ),
      ],
    );
  }
}

class PaymentVoucherList extends StatefulWidget {
  PaymentVoucherList({this.timePeriod});

  final String timePeriod;

  @override
  _PaymentVoucherListState createState() => _PaymentVoucherListState();
}

class _PaymentVoucherListState extends State<PaymentVoucherList> {
  TextEditingController editingController = TextEditingController();
  Iterable<Voucher> paymentVoucherData;
  List<Voucher> paymentVoucherDataforDisplay = List<Voucher>();

  @override
  void initState() {
    paymentVoucherData = Provider.of<List<Voucher>>(context, listen: false)
     .where((voucher) => voucher.primaryVoucherType == 'Payment');
    paymentVoucherData =
        filterVouchersByTimePeriod(paymentVoucherData, widget.timePeriod);
    paymentVoucherDataforDisplay.addAll(paymentVoucherData);

    super.initState();
  }

  void filterSearchResults(String query) {
    List<Voucher> dummySearchList = List<Voucher>();
    dummySearchList.addAll(paymentVoucherData);
    if (query.isNotEmpty) {
      List<Voucher> dummyListData = List<Voucher>();
      dummySearchList.forEach((item) {
        if (item.partyname.toLowerCase().contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        paymentVoucherDataforDisplay.clear();
        paymentVoucherDataforDisplay.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        paymentVoucherDataforDisplay.clear();
        paymentVoucherDataforDisplay.addAll(paymentVoucherData);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final paymentVoucherData = Provider.of<List<PaymentVoucher>>(context);
    String voucherIdView;
    String partyGuid;

    return Container(
        height: MediaQuery.of(context).size.height / 1.1,
        child: Column(
          children: <Widget>[
            Padding(
              padding: spacer.all.xxs,
              child: Text(
                  'Total Payment Vouchers: ${paymentVoucherDataforDisplay.length}'),
            ),
            Container(
              padding: spacer.bottom.xs,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50.0,
                  child: TextField(
                    onChanged: (value) {
                      filterSearchResults(value.toLowerCase());
                    },
                    controller: editingController,
                    style: Theme.of(context).textTheme.bodyText2,
                    enableSuggestions: true,
                    decoration: InputDecoration(
                      labelText: "Search",
                      hintText: "Search by party name...",
                      hintStyle: Theme.of(context).textTheme.bodyText2,
                      labelStyle: Theme.of(context).textTheme.bodyText2,
                      counterStyle: Theme.of(context).textTheme.bodyText2,
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: paymentVoucherDataforDisplay?.length ?? 0,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onDoubleTap: () => {
                            voucherIdView =
                                paymentVoucherDataforDisplay[index]?.masterid,
                            partyGuid =
                                paymentVoucherDataforDisplay[index]?.partyGuid,
                            Navigator.pushNamed(
                              context,
                              '/voucherview',
                              arguments: {
                                'voucher_id_view': voucherIdView,
                                'party_guid': partyGuid,
                              },
                            ),
                            // Navigator.of(context).pushReplacement(
                            //   MaterialPageRoute(
                            //     builder: (context) => VoucherView(
                            //       voucherId: voucherIdView,
                            //       partyGuid: partyGuid,
                            //     ),
                            //   ),
                            // )
                          },
                      child: PaymentVoucherTile(
                          paymentVoucher: paymentVoucherDataforDisplay[index]));
                },
              ),
            ),
          ],
        ));
  }
}

class PaymentVoucherTile extends StatelessWidget {
  PaymentVoucherTile({this.paymentVoucher});

  final Voucher paymentVoucher;

  @override
  Widget build(BuildContext context) {
    return DetailCard(
        paymentVoucher.partyname,
        '# ${paymentVoucher.number}',
        paymentVoucher.type,
        formatIndianCurrency(positiveAmount(paymentVoucher.amount).toString()),
        _formatDate(paymentVoucher.date));
  }
}
