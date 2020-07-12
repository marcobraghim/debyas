import 'dart:developer';

import 'package:debyas/views/layout/layout_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DatabaseMenuBar extends StatefulWidget {
  @override
  _DatabaseMenuBarState createState() => _DatabaseMenuBarState();
}

class _DatabaseMenuBarState extends State<DatabaseMenuBar> {
  bool _isExtended = false;
  bool _showItemText = false;
  bool _delaying = false;

  int _selectedItem;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isExtended = true;
        });

        _delaying = true;
        Future.delayed(Duration(milliseconds: 300), () {
          if (_delaying) {
            setState(() {
              _showItemText = true;
            });

            _delaying = false;
          }
        });
      },
      onExit: (event) => setState(() {
        _isExtended = false;

        _showItemText = false;
        _delaying = false;
      }),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: const EdgeInsets.all(5),
        width: _isExtended ? 300 : 50,
        color: LayoutColors.secondary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            item('tooba', 0),
            item('buster', 1),
            item('cereo', 2),
            item('lider', 3),
            item('hontaro', 4),
          ],
        ),
      ),
    );
  }

  item(String name, int itemIndex) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        child: MouseRegion(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                child: Text(name[0].toUpperCase()),
                backgroundColor: (_selectedItem == itemIndex)
                    ? LayoutColors.ligth.withOpacity(.3)
                    : LayoutColors.dark,
                foregroundColor: Colors.white,
              ),
              _showItemText ? SizedBox(width: 10) : SizedBox.shrink(),
              _showItemText
                  ? Expanded(
                      child: Text(
                        '$name\n127.0.0.1',
                        style: Theme.of(context).textTheme.subtitle2.copyWith(
                              color: (_selectedItem == itemIndex)
                                  ? Colors.white
                                  : LayoutColors.darkness,
                              fontWeight: (_selectedItem != itemIndex)
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                      ),
                    )
                  : SizedBox.shrink(),
              _showItemText
                  ? InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: LayoutColors.ligthness,
                        ),
                        padding: const EdgeInsets.all(7),
                        margin: const EdgeInsets.only(right: 10),
                        child: Icon(
                          FontAwesomeIcons.trashAlt,
                          color: LayoutColors.danger,
                          size: 16,
                        ),
                      ),
                      onTap: () => print('Excluir $name'),
                      borderRadius: BorderRadius.circular(50),
                    )
                  : SizedBox.shrink(),
            ],
          ),
          cursor: SystemMouseCursors.click,
        ),
        onTap: () {
          setState(() {
            _selectedItem = itemIndex;
          });

          print('Base de dados $name');
        },
      ),
    );
  }
}
