import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import '../app_state.dart';
import '../../models/user/user_model.dart';
/***************** User Actions *******************/



class GetUserAction {
  final UserModel _user;
  UserModel get user => this._user;
  GetUserAction(
    this._user,
  );
}

class GetUserActionException {
  final String _userException;
  String get userException => this._userException;
  GetUserActionException(
    this._userException,
  );
}

// Do not touch sweatheart!
class UserLogoutAction {}
