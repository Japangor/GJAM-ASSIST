import 'package:flutter/material.dart';
import 'package:tall/core/models/production.dart';
import 'package:tall/theme/dimensions.dart';

import 'package:tall/ui/shared/headernav.dart';
import 'package:tall/core/services/database.dart';
import 'package:provider/provider.dart';
import 'package:tall/ui/widgets/productionForm.dart';
import 'package:tall/ui/widgets/productionList.dart';
import 'package:tall/ui/widgets/sectionHeader.dart';





class ProductionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    void _showProductionPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: spacer.all.xs,
          child: ProductionForm(),
        );
      }
      );
    }
    final GlobalKey<ScaffoldState> _drawerKey = new GlobalKey<ScaffoldState>();


    return StreamProvider<List<Production>>.value (
          value: DatabaseService().productionData,
          child: Scaffold(
        appBar: headerNav(_drawerKey),
        // bottomNavigationBar: bottomNav(),
        body: Column(
          children: <Widget>[
            SectionHeader('Daily Production Report'),
            RaisedButton.icon(
              icon: Icon(Icons.add),
              label: Text('Record Data'),
              onPressed: () => _showProductionPanel(),
            ),            
             
             ProductionList(),
             
          ],

        )
          
        
        ),
          );
  }
}