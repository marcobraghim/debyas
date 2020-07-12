import 'package:debyas/views/layout/layout_colors.dart';
import 'package:debyas/views/layout/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LayoutSidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var umQuinto = MediaQuery.of(context).size.width / 5;
    var minSize = 280.0;

    return Container(
      height: double.infinity,
      width: umQuinto > minSize ? umQuinto : minSize,
      decoration: BoxDecoration(
        color: LayoutColors.darkness,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          topLeft: Radius.circular(10),
        ),
      ),
      child: ListView(
        children: [
          UserProfile(),
          connectionButton(true),
          databaseButton(context),
          databaseButton(context),
          databaseButton(context),
          databaseButton(context),
          databaseButton(context),
          databaseButton(context),
          databaseButton(context),
          databaseButton(context),
          databaseButton(context),
          connectionButton(),
          connectionButton(),
          connectionButton(),
        ],
      ),
    );
  }

  connectionButton([bool selected = false]) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 7.5, 15, 7.5),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: RaisedButton(
          onPressed: () => null,
          textColor: Colors.white,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 10),
              Icon(
                FontAwesomeIcons.server,
                size: 14,
              ),
              SizedBox(width: 10),
              Text('Database Sakyamuni'),
              Expanded(child: SizedBox.shrink()),
              Icon(
                FontAwesomeIcons.chevronRight,
                size: 14,
              ),
            ],
          ),
          color: selected ? LayoutColors.secondary : Colors.grey[800],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  databaseButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(45, 0, 30, 5),
      child: SizedBox(
        height: 20,
        width: double.infinity,
        child: MouseRegion(
          child: GestureDetector(
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.database,
                  size: 14,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  'tooba',
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
            onTap: () => print('Uma base de dados...'),
          ),
          cursor: SystemMouseCursors.click,
        ),
      ),
    );
  }
}
