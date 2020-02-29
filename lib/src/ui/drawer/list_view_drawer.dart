import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:krappr/src/utilities/constants.dart';

// note that when adding listtiles that are NOT navigating elsewhere
// you'll want to add Navigator.pop(context);
class ListViewDrawer extends StatelessWidget {
  final List<ListViewDrawerItem> items;

  ListViewDrawer(this.items);

  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[
      DrawerHeader(
        child: Text(KRAPPR,
            style: Theme.of(context)
                .primaryTextTheme
                .title), // TODO: Issue #5 - constants should not be hardcoded
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
      ),
    ];

    for (var item in items) {
      widgets.add(ListTile(
        title: Text(item.title),
        onTap: item.callback,
      ));
    }

    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: widgets),
    );
  }
}

class ListViewDrawerItem {
  VoidCallback callback;
  String title;
  ListViewDrawerItem(this.title, this.callback);
}

class ScreenNavigationDrawerItem<T extends StatefulWidget>
    extends ListViewDrawerItem {
  ScreenNavigationDrawerItem(T screen)
      : super(T.toString().replaceAll(r"Screen", ""), () => Get.to(screen));
}
