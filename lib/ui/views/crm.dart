
import 'package:flutter/material.dart';
import 'package:tall/theme/theme.dart';
import 'package:tall/ui/shared/drawer.dart';
import 'package:tall/ui/shared/headernav.dart';
import 'package:tall/ui/widgets/sectionHeader.dart';


class CRMScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

  // final user = Provider.of<FirebaseUser>(context);
  final GlobalKey<ScaffoldState> _drawerKey = new GlobalKey<ScaffoldState>();

    return  Scaffold(
        key: _drawerKey,
        drawer: tassistDrawer(context),
        appBar: headerNav(_drawerKey),
        body: ListView(
          children: <Widget>[
          SectionHeader('CRM'),

        Padding(
          padding: spacer.all.xxl,
          child: Column(
            
                    children: <Widget> [
                    
                    Text('Coming Soon... '),
                    SizedBox(height: 10.0),
                    Text('Want it sooner? WhatsApp us!')
                    ]
          ),
        ),
        
          ],
        )   
      );
  }
}



