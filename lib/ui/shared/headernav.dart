
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:tall/theme/colors.dart';
import 'package:tall/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

AppBar headerNav(GlobalKey<ScaffoldState> _drawerkey ) {
// headerNav(_drawerkey);

// GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  bool enabled = true;
   

  return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(left: 12),
        child: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute(
            //     builder: (context) => MenuScreen(),
            //   ),
            // // );
            if (enabled) {
              // open drawer if this value is true
              _drawerkey.currentState.openDrawer();
            }
          },
        ),
      ),
      title: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               Container(
                //  width: MediaQuery.of(context).size.width /2,
                 child: Text(
                  'GJAMAssist',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 1.0,
                  ),
              ),
               ),
              Text(
                'Beta',
                style: TextStyle(
                  color: TassistWhite,
                  fontSize: 12,
                  letterSpacing: 1.0,
                ),
              ),
          ],
        ),
        Spacer(),
        Text('Help?', style: TextStyle(fontSize: 14.0, letterSpacing: 1.0),),
        IconButton(
        icon: Icon(FontAwesomeIcons.whatsapp),
        onPressed: () => _launchURL()
            )
        // DropDownMonths(),
      ],
    ),
    backgroundColor: TassistMenuBg
  );
}


_launchURL() async {
  const url = '';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}




class DropDownMonths extends StatefulWidget {
  @override
  _DropDownMonthsState createState() => _DropDownMonthsState();
}

class _DropDownMonthsState extends State<DropDownMonths> {
  var selectedValue;

  List<String> _months = <String>['1 month', '3 months', '6 months', '1 year'];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownButton(
        items: _months
            .map((value) => DropdownMenuItem(
                  child: Text(
                    value,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: TassistPrimaryBackground),
                  ),
                  value: value,
                ))
            .toList(),
        onChanged: (selectedMonth) {
          setState(() {
            selectedValue = selectedMonth;
          });
        },
        // value: Text(selectedValue.toString(), style: Theme.of(context).textTheme.bodyText1.copyWith(
        //       color: TassistWhite,
        //       fontSize: 12.0,
        //     )),
        value: selectedValue,

        isExpanded: false,
        hint: Text('Period',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: TassistWhite,
                  fontSize: 12.0,
                )),
      ),
    );
  }
}
