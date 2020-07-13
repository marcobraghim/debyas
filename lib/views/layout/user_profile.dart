import 'package:debyas/views/layout/layout_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: LayoutColors.dark.withOpacity(.3),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            child: Image.asset(
              'assets/images/marco.braghim.jpg',
              fit: BoxFit.cover,
              width: 75,
            ),
            borderRadius: BorderRadius.circular(75),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Marco A. Braghim',
                style: Theme.of(context).textTheme.subtitle2.copyWith(
                      color: LayoutColors.ligthness,
                    ),
              ),
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.userCog,
                  color: LayoutColors.ligthness,
                ),
                onPressed: () => null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
