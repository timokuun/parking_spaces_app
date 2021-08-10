import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/* Routers */
import './Parker/main_router.dart';

import 'theme.dart';
import './providers/providers.dart';
import './screens/login_screen.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: customBlack,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    // Call init to init or obtain user info
    var initUser = context.read(userInfoProvider);
    initUser.init();

    return Sizer(
      builder: (context, orientation, deviceType) {
        return Consumer(
          builder: (context, watch, child) {
            var user = watch(userInfoProvider);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Aniimo Parking',
              theme: lightThemeData(context),
              darkTheme: darkThemeData(context),
              themeMode:
                  user.settings.darkMode ? ThemeMode.dark : ThemeMode.light,
              // themeMode: ThemeMode.dark,

              // TODO: Set up backend user auth
              home: user.auth.sessionToken.isEmpty ? LoginPage() : MainRouter(),
              // home: LoginPage(),
            );
          },
        );
      },
    );
  }
}
