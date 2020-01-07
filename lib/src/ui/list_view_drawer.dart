import 'package:flutter/material.dart';
import '../bloc/list_view_drawer_bloc.dart';

// note that when adding listtiles that are NOT navigating elsewhere
// you'll want to add Navigator.pop(context);
class ListViewDrawer extends StatelessWidget {
  final ListViewDrawerBloc bloc = ListViewDrawerBloc();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Krappr',
              style: Theme.of(context).primaryTextTheme.title,
            ), // TODO: Issue #5 - constants should not be hardcoded
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
            ),
          ),
          ListTile(
            // TODO: Issue # 7 - List of pages should not be hardcoded
            title: Text("Logout"),
            onTap: bloc.logoutUser,
          ),
        ],
      ),
    );
  }
}
