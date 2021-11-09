import 'package:flutter/material.dart';
import 'package:tall/core/services/auth.dart';
import 'package:tall/theme/colors.dart';
import 'package:tall/theme/dimensions.dart';
import 'package:tall/ui/root_page.dart';
import 'package:tall/ui/views/accountsreceivables.dart';
import 'package:tall/ui/views/gstreportscreen.dart';
import 'package:tall/ui/views/khatascreen.dart';
import 'package:tall/ui/views/productionInput.dart';
import 'package:tall/ui/views/pruchaseorderreport.dart';
import './dashboard.dart';
import './salesorderreport.dart';
import './notifications.dart';
import './productperformance.dart';

class MenuScreen extends StatefulWidget {
  // MenuScreen({Key key, this.auth, this.userId, this.onSignedOut})
  //     : super(key: key);
  // final BaseAuth auth;
  // final VoidCallback onSignedOut;
  // final String userId;

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // _signOut() async {
  //   try {
  //     await widget.auth.signOut();
  //     widget.onSignedOut();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TassistMenuBg,
        title: Text(
          'Menu',
          style: TextStyle(
            letterSpacing: 1.0,
          ),
        ),
      ),
      backgroundColor: TassistMenuBg,
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: spacer.x.sm,
                    child: Icon(
                      Icons.mail_outline,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Notifications',
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: TassistWhite),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => NotificationScreen(),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: spacer.x.sm,
                    child: Icon(
                      Icons.dashboard,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Dashboard',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: TassistWhite),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => DashboardScreen(),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: spacer.x.sm,
                    child: Icon(
                      Icons.domain,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Product Performance',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: TassistWhite),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => (ProductPerformanceScreen()),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: spacer.x.sm,
                    child: Icon(
                      Icons.book,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Your Secret Khata',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: TassistWhite),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => (KhataScreen()),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: spacer.x.sm,
                    child: Icon(
                      Icons.card_giftcard,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Sales',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: TassistWhite),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => SalesOrderReportScreen(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: spacer.x.sm,
                    child: Icon(
                      Icons.card_membership,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Purchases',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: TassistWhite),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => PurchaseOrderReportScreen(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: spacer.x.sm,
                    child: Icon(
                      Icons.face,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Accounts Receivables',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: TassistWhite),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => AccountsReceivableScreen(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: spacer.x.sm,
                    child: Icon(
                      Icons.insert_drive_file,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'GST Report',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: TassistWhite),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => GstReportScreen(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: spacer.x.sm,
                    child: Icon(
                      Icons.build,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Production',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: TassistWhite),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => ProductionScreen(),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: spacer.x.sm,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Sign Out',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: TassistWhite),
                  ),
                ],
              ),
              onTap: () async {
                await _auth.signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => RootPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
