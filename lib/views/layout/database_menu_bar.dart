import 'package:debyas/views/layout/layout_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DatabaseMenuBar extends StatefulWidget {
  @override
  _DatabaseMenuBarState createState() => _DatabaseMenuBarState();
}

class _DatabaseMenuBarState extends State<DatabaseMenuBar> {
  //

  // O box esta aberto?
  bool _isExtended = false;

  // Esta em andamento a animacao?
  bool _delaying = false;

  // Numero do item selecionado
  int _selectedItem;

  // Retorna true caso esteja aberto
  // e a animacao ja terminou
  _showItemText() {
    return _isExtended && !_delaying;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        _delaying = true;
        Future.delayed(Duration(milliseconds: 100), () {
          if (_delaying) {
            setState(() {
              _isExtended = true;
            });
          }
        });
      },
      onExit: (event) => setState(() {
        _isExtended = false;
        _delaying = false;
      }),
      child: AnimatedContainer(
        onEnd: () {
          setState(() {
            _delaying = false;
          });
        },
        duration: Duration(milliseconds: 100),
        padding: const EdgeInsets.all(5),
        width: _isExtended ? 300 : 51,
        decoration: BoxDecoration(
          color: LayoutColors.secondary,
          border: Border(
            right: BorderSide(
              width: 1,
              color: LayoutColors.darkness,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                child: MouseRegion(
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.bars,
                      color: LayoutColors.ligthness,
                    ),
                    onPressed: () => print('Options'),
                  ),
                  cursor: SystemMouseCursors.click,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  item('tooba', 0),
                  item('buster', 1),
                  item('cereo', 2),
                  item('lider', 3),
                  item('hontaro', 4),
                ],
              ),
            )
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
              _showItemText() ? SizedBox(width: 10) : SizedBox.shrink(),
              _showItemText()
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
              _showItemText()
                  ? InkWell(
                      child: Tooltip(
                        message: 'Encerrar esta conexão',
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: LayoutColors.ligth.withOpacity(.3),
                            border: Border.all(
                              width: 1,
                              color: LayoutColors.ligth,
                            ),
                          ),
                          padding: const EdgeInsets.all(7),
                          margin: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.cloud_off,
                            color: LayoutColors.ligthness,
                            size: 16,
                          ),
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
