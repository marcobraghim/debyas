import 'package:debyas/views/layout/layout_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: LayoutColors.dark,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _topMenuItem(context, FontAwesomeIcons.play, 'Serve'),
          _topMenuItem(context, FontAwesomeIcons.user, 'Users'),
          _topMenuItem(context, FontAwesomeIcons.cog, 'Settings'),
        ],
      ),
    );
  }

  _topMenuItem(BuildContext context, IconData icon, String name) {
    return Container(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            color: LayoutColors.ligthness,
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: LayoutColors.ligthness,
                ),
          ),
        ],
      ),
    );
  }
}
