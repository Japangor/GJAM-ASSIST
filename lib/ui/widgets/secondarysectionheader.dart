
import 'package:flutter/material.dart';
import 'package:tall/theme/colors.dart';
import 'package:tall/theme/dimensions.dart';

class SecondarySectionHeader extends StatelessWidget {

  final sectionText;

  SecondarySectionHeader(this.sectionText);

  @override
  Widget build(BuildContext context) {
    return Container(

            color: TassistBgLightPurple,
            padding: spacer.x.xs,
            child:
            Text(sectionText, style: Theme.of(context).textTheme.bodyText2.copyWith(
              fontWeight: FontWeight.bold
            ))
          );
  }
}