import 'package:krappr/src/ui/review_screen.dart';

import '../ui/home_screen.dart';
import '../ui/list_view_drawer.dart';
import 'authorization_bloc.dart';

class ListViewDrawerBloc {
  logoutUser() {
    authBloc.closeSession();
  }

  ListViewDrawer getDefaultListDrawer() {
    return ListViewDrawer([
      ScreenNavigationDrawerItem(HomeScreen()),
      ScreenNavigationDrawerItem(ReviewScreen()),
      ListViewDrawerItem("Logout", () => authBloc.closeSession()),
    ]);
  }
}
