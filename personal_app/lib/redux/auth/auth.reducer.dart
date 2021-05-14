// User Reducer
import '../../models/auth/auth.model.dart';
import './auth.action.dart';

AuthModel authReducer(AuthModel auth, dynamic action) {
  if (action is SetUserAuthAction) {
    return action.auth;
  }
  return auth;
}
