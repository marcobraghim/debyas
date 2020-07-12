import 'package:debyas/views/layout.dart';
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
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  FontAwesomeIcons.user,
                  color: LayoutColors.ligthness,
                ),
                Text(
                  'Usuários',
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: LayoutColors.ligthness,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
