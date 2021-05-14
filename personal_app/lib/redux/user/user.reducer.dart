// User Reducer
import '../../models/user/user_model.dart';
import './user.action.dart';

UserModel userReducer(UserModel user, dynamic action) {
  if (action is GetUserAction) {
    // return user from action

    // !TODO: Update if needed

    return action.user;
  }
  return user;
}
