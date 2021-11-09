import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tall/core/models/inactivecustomer.dart';
import 'package:tall/core/models/payables.dart';
import 'package:tall/core/models/receivables.dart';
import 'package:tall/core/models/stockitem.dart';
import 'package:tall/core/models/vouchers.dart';
import 'package:tall/core/services/auth.dart';
import 'package:tall/core/services/database.dart';
import 'package:tall/core/services/inactivecustomerservice.dart';
import 'package:tall/core/services/payablesservice.dart';
import 'package:tall/core/services/receivablesservice.dart';
import 'package:tall/core/services/stockservice.dart';
import 'package:tall/core/services/vouchers.dart';
import 'package:tall/route_generator.dart';
import 'package:tall/theme/texts.dart';
import 'core/models/company.dart';
import 'core/models/ledger.dart';
import 'core/services/companyservice.dart';
import 'core/services/ledgerservice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const String _title = "GJAMAssist";

    return MultiProvider(providers: [
      StreamProvider<FirebaseUser>.value(
        value: AuthService().user,
      ),
    ], child: TopWidget(title: _title));
  }
}

class TopWidget extends StatefulWidget {
  const TopWidget({
    Key key,
    @required String title,
  })  : _title = title,
        super(key: key);

  final String _title;

  @override
  _TopWidgetState createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  // final Firestore _db = Firestore.instance;

  final FirebaseMessaging _fcm = FirebaseMessaging();

  // StreamSubscription iosSubscription;

  @override
  void initState() {
    super.initState();

    // String uid = Provider.of<FirebaseUser>(context, listen: false).uid;

    // if (Platform.isIOS) {
    //   iosSubscription = _fcm.onIosSettingsRegistered.listen((data) {
    //     print(data);
    //     _saveDeviceToken();
    //   });

    //   _fcm.requestNotificationPermissions(IosNotificationSettings());
    // } else {
    _saveDeviceToken();
    // }

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        // final snackbar = SnackBar(
        //   content: Text(message['notification']['title']),
        //   action: SnackBarAction(
        //     label: 'Go',
        //     onPressed: () => null,
        //   ),
        // );

        // Scaffold.of(context).showSnackBar(snackbar);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['body']),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.amber,
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }

  /// Get the token, save it to the database for current user
  _saveDeviceToken() async {
    // Get the current user
    // String uid = 'jeffd23';
    // FirebaseUser user = await _auth.currentUser();

    // Get the token for this device
    await _fcm.getToken();

    // Save it to Firestore
    // if (fcmToken != null) {
    //   var tokens = _db
    //       .collection('company')
    //       .document(uid)
    //       .collection('tokens')
    //       .document(fcmToken);

    //   await tokens.setData({
    //     'token': fcmToken,
    //     'createdAt': FieldValue.serverTimestamp(), // optional
    //     'platform': Platform.operatingSystem // optional
    //   });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    return MultiProvider(
      providers: [
        StreamProvider<List<ReceivablesItem>>.value(
          // initialData: List<ReceivablesItem>(),
          value: ReceivablesItemService(uid: user?.uid).accountsReceivableData,
        ),
        // LEDGER/PARTY DATA
        StreamProvider<List<LedgerItem>>.value(
            value: LedgerItemService(uid: user?.uid).ledgerItemData),
        StreamProvider<List<StockItem>>.value(
            value: StockItemService(uid: user?.uid).stockItemsData),
        StreamProvider<List<PayablesItem>>.value(
            value: PayablesItemService(uid: user?.uid).accountsPayablesData),
        StreamProvider<List<InactiveCustomer>>.value(
            value:
                InactiveCustomerService(uid: user?.uid).inactiveCustomerData),
        // StreamProvider<List<SalesVoucher>>.value(
        //     value: SalesVoucherService(uid: user?.uid).salesVoucherData),
        // StreamProvider<List<PurchaseVoucher>>.value(
        //     value: PurchaseVoucherService(uid: user?.uid).purchaseVoucherData),
        // StreamProvider<List<PaymentVoucher>>.value(
        //     value: PaymentVoucherService(uid: user?.uid).paymentVoucherData),
        // StreamProvider<List<ReceiptVoucher>>.value(
        //     value: ReceiptVoucherService(uid: user?.uid).receiptVoucherData),
        StreamProvider<List<Voucher>>.value(
            value: VoucherService(uid: user?.uid).voucherData),
        StreamProvider<Company>.value(
            value: CompanyService(uid: user?.uid).companyData),
        // StreamProvider<DocumentSnapshot>.value(
        //     value: DatabaseService()
        //         .companyCollection
        //         .document(user?.uid)
        //         .snapshots()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        // routes: {
        //   '/': (context) => RootPage(),
        //   '/vouchers': (context) => VouchersHome(),
        //   '/voucherview': (context) => VoucherView(),
        //   '/ledgerview': (context) => LedgerView(),
        //   '/ledgers': (context) => LedgerScreen()
        // },
        title: widget._title,
        // home: HomeScreen(),
        // home: RootPage(),
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            textTheme: TextTheme(headline6: primaryAppBarTitle),
          ),
          textTheme: TextTheme(
              headline6: secondaryListTitle,
              subtitle1: secondaryCategoryDesc,
              bodyText1: secondaryListDisc,
              bodyText2: secondaryListTitle2),
        ),
      ),
    );
  }
}
