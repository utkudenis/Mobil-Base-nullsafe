import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:personal_app/helpers/log_helper.dart';
import 'package:redux/redux.dart';
import './redux/redux_store.dart';
import './services/navigation/navigation_locator.dart';
import 'common/configuration.dart';
import 'common/enums.dart';
import 'common/localization/localization.dart';
import 'common/routes/custom_router.dart';
import 'common/routes/route_names.dart';
import 'helpers/app_state_helper.dart';
import 'redux/app_state.dart';
import 'theme/styles.dart';

void main() async {
  // initialize store
  final store = ReduxStore.getInitialStore();

  // for global usage of Navigation
  setupGlobalLocator();

  WidgetsFlutterBinding.ensureInitialized();

  runApp(App(store));
}

class App extends StatefulWidget {
  final Store<AppState> store;

  App(this.store);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  // Define locales that our app supports (no country codes, see comments below)
  final appSupportedLocales = <Locale>[
    Locale('tr', 'TR'),
    Locale('en', 'EN'),
  ];

  // Store dynamic changeable locale settings here, they change with the system changes
  String currentDefaultSystemLocale;
  List<Locale> currentSystemLocales;

  Locale setLocale(AppState state, BuildContext context) {
    Locale _locale = Locale("tr", "TR");

    // takes from server
    // if (state != null && state.user != null) {
    //   final language = state.user.language;
    //   if (language != null) {
    //     _locale = Locale(language.toString().toLowerCase(), language);
    //   }
    // }

    // takes from device
    _locale = currentSystemLocales.first;
    return _locale;
  }

  // Here we read the current locale values
  void setCurrentValues() {
    currentSystemLocales = WidgetsBinding.instance.window.locales;
    currentDefaultSystemLocale = Platform.localeName;
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    setCurrentValues();
    //CommonHelper.navigationService = locator<NavigationService>();
  }

  @override
  void didChangeLocales(List<Locale> locale) {
    // This is run when system locales are changed
    super.didChangeLocales(locale);
    // Update state with the new values and redraw controls
    setState(() {
      setCurrentValues();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // App is visible and running.
    if (state == AppLifecycleState.resumed) {
      //  Reload app If session is not alive.

      if (AppStateHelper.isCameraOrGalleryActive) {
        AppStateHelper.isCameraOrGalleryActive = false;
      }
      // open socket
      //SignalRConnection().startSignalR();

      AppStateHelper.isApplicationAcitve = true;
    } else {
      AppStateHelper.isApplicationAcitve = false;
    }

    // check push notification entegrations
    // var _ = NotificationRegistrationService();

    LogHelper.logMessage(this.runtimeType.toString(), "didChangeAppLifecycleState", "state info : " + state.toString());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return StoreProvider(
      store: widget.store,
      child: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          var store = StoreProvider.of<AppState>(context);
          ReduxStore.currentStore = store;

          return MaterialApp(
            navigatorKey: AppStateHelper.navigationService.navigatorKey,
            debugShowCheckedModeBanner: false,
            title: Configuration.environment == EnumsEnvironment.Test ? "Koç Diyalog Test" : "Koç Diyalog",
            theme: basicTheme(),
            localizationsDelegates: [
              Localization.delegete,
              GlobalMaterialLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate
            ],
            locale: setLocale(state, context),
            supportedLocales: this.appSupportedLocales,
            onGenerateRoute: CustomRouter.allRoutes,
            initialRoute: RouteNames.loginRoute,
          );
        },
      ),
    );
  }
}
