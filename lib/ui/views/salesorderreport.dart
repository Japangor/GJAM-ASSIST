import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tall/core/services/database.dart';
import 'package:tall/ui/shared/drawer.dart';
import 'package:tall/ui/shared/headernav.dart';
import 'package:tall/ui/views/vouchers.dart';
import 'package:tall/ui/widgets/coloredIcon.dart';
import 'package:tall/ui/widgets/gotobar.dart';
import 'package:tall/ui/widgets/inactivecustomerlist.dart';
import 'package:tall/ui/widgets/secondarysectionheader.dart';
import 'package:tall/ui/widgets/sectionHeader.dart';

class SalesOrderReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    final GlobalKey<ScaffoldState> _drawerKey = new GlobalKey<ScaffoldState>();

    return MultiProvider(
        providers: [
          StreamProvider<DocumentSnapshot>.value(
              value: DatabaseService(uid: user?.uid)
                  .metricCollection
                  .document(user.uid)
                  .snapshots()),
        ],
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            key: _drawerKey,
            drawer: tassistDrawer(context),
            appBar: headerNav(_drawerKey),
            // bottomNavigationBar: bottomNav(),
            body: ListView(
              children: <Widget>[
                SectionHeader('Sales Report'),
                // Container(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: <Widget>[
                //       Expanded(
                //         child: Container(
                //           padding: spacer.x.xs,
                //           margin: spacer.all.xxs,
                //           color: TassistBgBlue,
                //           child: Row(
                //             children: <Widget>[
                //               Text('Product'),
                //               Icon(Icons.arrow_drop_down,
                //                   color: Colors.purple[800]),
                //             ],
                //           ),
                //         ),
                //       ),
                //       Expanded(
                //         child: Container(
                //           padding: spacer.x.xs,
                //           margin: spacer.all.xxs,
                //           color: TassistBgBlue,
                //           child: Row(
                //             children: <Widget>[
                //               Text('Customer'),
                //               Icon(Icons.arrow_drop_down,
                //                   color: Colors.purple[800]),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        ColoredIconNumberRow('total_sales', 'Amount Sold'),
                        // ColoredIconNumberRow('open_sales_orders', 'Open Orders'),
                        ColoredIconNumberRow('num_sales_vouchers', '# Vouchers'),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        // ColoredIconNumberRow('qty_sales_order', 'Ordered Qty'),
                        // ColoredIconNumberRow('qty_sales_due', 'Quantity Due'),
                        ColoredIconNumberRow('total_receipts', 'Total Receipts'),                
                        ColoredIconNumberRow('num_receipts_vouchers', '# Vouchers'),
                      ],
                    )
                  ],
                ),
                // FilterBar('Sales Vouchers By', 'Due Date'),
                GoToBar('Sales Vouchers', VouchersHome()),
                // SalesVoucherList(),

                SecondarySectionHeader('Inactive Customer List'),

                InactiveCustomerList()
              ],
            ),
          ),
        ));
  }
}
