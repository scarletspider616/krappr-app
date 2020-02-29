import 'package:krappr/src/ui/screen/review_screen.dart';
import 'package:krappr/src/utilities/constants.dart';

import '../ui/screen/home_screen.dart';
import '../ui/drawer/list_view_drawer.dart' show ListViewDrawer, ListViewDrawerItem, ScreenNavigationDrawerItem;
import 'authorization_bloc.dart';

class ListViewDrawerBloc {
  logoutUser() {
    authBloc.closeSession();
  }

  ListViewDrawer getDefaultListDrawer() {
    return ListViewDrawer([
      ScreenNavigationDrawerItem(HomeScreen()),
      ScreenNavigationDrawerItem(ReviewScreen()),
      ListViewDrawerItem(LOGOUT, () => authBloc.closeSession()),
    ]);
  }
}
