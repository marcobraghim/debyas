import 'package:debyas/views/layout/layout_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DatabaseMenuBar extends StatelessWidget {
  DatabaseMenuBar({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      color: LayoutColors.secondary,
      child: Column(
        children: [
          item(),
          item(),
          item(true),
          item(),
          item(),
        ],
      ),
    );
  }

  item([bool active = false]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        child: MouseRegion(
          child: Tooltip(
            message: 'tooba em 127.0.0.1',
            child: CircleAvatar(
              child: Text('T'),
              backgroundColor: active
                  ? LayoutColors.ligth.withOpacity(.3)
                  : LayoutColors.dark,
              foregroundColor: Colors.white,
            ),
          ),
          cursor: SystemMouseCursors.click,
        ),
        onTap: () => print('Base de dados TOOBA'),
      ),
    );
  }
}
