// Packages
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
// Local Redux
import './app_state.dart';
import './app_reducer.dart';

class ReduxStore {
  static Store<AppState> currentStore;

  static Store<AppState> getInitialStore() {
    return Store<AppState>(
      appReducer,
      initialState: AppState.initial(),
      middleware: [
        thunkMiddleware,
        // new LoggingMiddleware.printer(),
      ],
    );
  }
}