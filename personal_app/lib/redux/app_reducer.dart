import './app_state.dart';
import './exports/reducers.dart';
import './user/user.action.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is UserLogoutAction) {
    return AppState.initial();
  }

  return AppState(
    // Common
    auth: authReducer(state.auth, action),
  );
}
