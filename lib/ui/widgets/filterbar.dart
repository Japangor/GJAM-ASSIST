import 'package:flutter/material.dart';
import 'package:tall/theme/colors.dart';
import 'package:tall/theme/dimensions.dart';

class FilterBar extends StatelessWidget {
  final String filterText;
  final String filterType;
  
  FilterBar(this.filterText, this.filterType);
  

  @override
  Widget build(BuildContext context) {
    return  Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: spacer.left.xs,
                    height: 20,
                    color: TassistBgBlue,
                    child: Row(
                      children: <Widget>[
                        Text(filterText,
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontSize: 14
                        )
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  color: TassistBgBlue,
                  padding: spacer.right.xs,
                  child: Align(
                    alignment: Alignment.centerRight,
                      child: Row(
                      children: <Widget>[
                        Text(filterType,
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontSize: 14
                        )
                        ),
                        Icon(Icons.arrow_drop_down, color: Colors.purple[800]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
         }
}