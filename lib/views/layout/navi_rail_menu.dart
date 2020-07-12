import 'package:debyas/views/layout/layout_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NaviRailMenu extends StatefulWidget {
  @override
  _NaviRailMenuState createState() => _NaviRailMenuState();
}

class _NaviRailMenuState extends State<NaviRailMenu> {
  int _selectedIndex = 0;
  bool _isExtended = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() {
        _isExtended = true;
      }),
      onExit: (event) => setState(() {
        _isExtended = false;
      }),
      child: NavigationRail(
        extended: _isExtended,
        backgroundColor: LayoutColors.secondary,
        selectedIconTheme: IconThemeData(color: Colors.white),
        selectedLabelTextStyle: TextStyle(
          color: Colors.white,
        ),
        unselectedLabelTextStyle: TextStyle(
          color: LayoutColors.dark,
          fontWeight: FontWeight.bold,
        ),
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        leading: Icon(
          FontAwesomeIcons.bars,
          color: Colors.white,
        ),
        destinations: [
          NavigationRailDestination(
            icon: CircleAvatar(
              child: Text('T'),
              backgroundColor: LayoutColors.dark,
              foregroundColor: Colors.white,
            ),
            selectedIcon: CircleAvatar(
              child: Text('T'),
              backgroundColor: LayoutColors.ligth.withOpacity(.3),
              foregroundColor: Colors.white,
            ),
            label: Text('tooba em 127.0.0.1'),
          ),
          NavigationRailDestination(
            icon: CircleAvatar(
              child: Text('S'),
              backgroundColor: LayoutColors.dark,
              foregroundColor: Colors.white,
            ),
            selectedIcon: CircleAvatar(
              child: Text('S'),
              backgroundColor: LayoutColors.ligth.withOpacity(.3),
              foregroundColor: Colors.white,
            ),
            label: Text('sakyamuni em 127.0.0.1'),
          ),
          NavigationRailDestination(
            icon: CircleAvatar(
              child: Text('C'),
              backgroundColor: LayoutColors.dark,
              foregroundColor: Colors.white,
            ),
            selectedIcon: CircleAvatar(
              child: Text('C'),
              backgroundColor: LayoutColors.ligth.withOpacity(.3),
              foregroundColor: Colors.white,
            ),
            label: Text('cerebro em 127.0.0.1'),
          ),
          newItem(),
          newItem(),
          newItem(),
          newItem(),
          newItem(),
          newItem(),
          newItem(),
          newItem(),
          newItem(),
          newItem(),
          newItem(),
        ],
      ),
    );
  }

  newItem() {
    return NavigationRailDestination(
      icon: CircleAvatar(
        child: Text('T'),
        backgroundColor: LayoutColors.dark,
        foregroundColor: Colors.white,
      ),
      selectedIcon: CircleAvatar(
        child: Text('T'),
        backgroundColor: LayoutColors.ligth.withOpacity(.3),
        foregroundColor: Colors.white,
      ),
      label: Text('tooba em 127.0.0.1'),
    );
  }
}
