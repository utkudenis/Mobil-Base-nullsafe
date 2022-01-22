// Packages
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
// Models
import '../../models/auth/auth.model.dart';
// Redux
import '../app_state.dart';
//import '../exports/actions.dart';
// Helpers
//import 'package:apmmobile/common/helpers/SharedPreferences/shared_preferences.keys.dart';
//import 'package:apmmobile/common/helpers/SharedPreferences/shared_preferences_helper.dart';

/***************** User Actions *******************/
/// Set UserId into State

ThunkAction<AppState> setUserAuthAction = (Store<AppState> store) async {
  // Get Cookie and User Id from Shared Preferences
  // final userId = await SharedPreferencesHelper.getString(SharedPreferencesKeys.userId);
  //final cookie = await SharedPreferencesHelper.getString(SharedPreferencesKeys.ssoLoginCookies);
  final auth = new AuthModel(
    userId: "userId",
    cookie: "cookie",
  );

  // Set Auth Data into State
  await store.dispatch(SetUserAuthAction(auth: auth));
};

class SetUserAuthAction {
  final AuthModel auth;
  SetUserAuthAction({
    required this.auth,
  });
}
