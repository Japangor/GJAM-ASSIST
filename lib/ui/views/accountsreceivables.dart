// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:tall/core/models/ledger.dart';
// import 'package:tall/core/services/ledgerservice.dart';
// import 'package:tall/theme/colors.dart';
// import 'package:tall/theme/dimensions.dart';
import 'package:tall/ui/shared/drawer.dart';
import 'package:tall/ui/shared/headernav.dart';
// import 'package:tall/ui/views/salesorderreport.dart';
// import 'package:tall/ui/widgets/bigmetricnoicon.dart';
// import 'package:tall/ui/widgets/gotobar.dart';
import 'package:tall/ui/views/accountsreceivablelist.dart';
// import 'package:tall/ui/widgets/secondarysectionheader.dart';
import 'package:tall/ui/widgets/sectionHeader.dart';



class AccountsReceivableScreen extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

        final GlobalKey<ScaffoldState> _drawerKey = new GlobalKey<ScaffoldState>();
        // final user = Provider.of<FirebaseUser>(context);

    return WillPopScope (
        onWillPop: () async => false,
    child: Scaffold(
        key: _drawerKey,
        drawer: tassistDrawer(context),
        appBar: headerNav(_drawerKey),
        // bottomNavigationBar: bottomNav(),
        body: ListView(
    children: <Widget>[
      SectionHeader('Accounts Receivables'),
      // Text('Dummy data, coming soon!'),
      // Padding(
      //   padding: spacer.all.xs,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: <Widget>[
      //      BigMetricNoIcon('30', '<30 days', TassistSuccess),
      //      BigMetricNoIcon('12', '30-45 days', TassistWarning),
      //      BigMetricNoIcon('16', '45-60 days', TassistDanger),
      //     ],
      //   ),
      // ),
      // SecondarySectionHeader('List of parties'),
    
      ARLedgerItemList(),
      // Padding(
      //   padding: spacer.y.xs,
      //   child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: <Widget>[
      //         Column(
      //           children: <Widget>[
      //           Icon(Icons.mail, color: TassistPrimary,),
      //           Text('Email All', style: Theme.of(context).textTheme.bodyText1,)
      //           ]
      //         ),
      //         Column(
      //           children: <Widget>[
      //           Icon(Icons.timer, color: TassistPrimary,),
      //           Text('Remind All', style: Theme.of(context).textTheme.bodyText1,)
      //           ]
      //         ),
      //         Column(
      //           children: <Widget>[
      //           Icon(Icons.add_alert, color: TassistPrimary,),
      //           Text('Alert Sales', style: Theme.of(context).textTheme.bodyText1,)
      //           ]
      //         )
      //       ]
      //   ),
      // ),
      // GoToBar('Sales Order Report', SalesOrderReportScreen())
      

    ],


        )


      ),
    );
  }
}