import 'authorization_bloc.dart';

class ListViewDrawerBloc {
  logoutUser() {
    authBloc.closeSession();
  }
}
