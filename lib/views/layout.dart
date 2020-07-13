import 'package:debyas/views/layout/database_menu_bar.dart';
import 'package:debyas/views/layout/layout_colors.dart';
import 'package:debyas/views/layout/sidebar.dart';
import 'package:debyas/views/layout/top_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Layout {
  static Widget render(
    BuildContext context, {
    Widget content,
    Widget floatingActionButton,
  }) {
    var layout = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.grey[300],
            Colors.grey[50],
            Colors.grey[400],
          ],
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LayoutSidebar(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TopMenu(),
                      Expanded(
                        child: Stack(
                          alignment: Alignment
                              .topLeft, // Inverte os itens para DatabaseMenuBar ficar acima do conteudo
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 51),
                              child: content,
                            ),
                            DatabaseMenuBar(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: LayoutColors.dark,
            height: 25,
          ),
        ],
      ),
    );

    return Scaffold(
      body: layout,
      floatingActionButton: floatingActionButton,
    );
  }
}
