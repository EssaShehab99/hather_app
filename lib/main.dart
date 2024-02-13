import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'src/config/routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      startLocale: Locale('ar'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark),
    );

    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeProvider>(
              create: (context) => ThemeProvider()),

          ChangeNotifierProvider<CUser>(create: (context) => CUser()..initial()),

        ],
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          final user=CUser.get(context).user;
          return FutureBuilder(
            future: Firebase.initializeApp(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) =>
                Consumer<ThemeProvider>(
                  builder: (context, _provider, _) => MaterialApp(
                    debugShowCheckedModeBanner: false,
                    localizationsDelegates: context.localizationDelegates,
                    supportedLocales: context.supportedLocales,
                    navigatorKey: NavigatorService.navigatorKey,
                    locale: context.locale,
                    title: 'ArtX',
                    themeMode: themeProvider.themeMode,
                    routes: AppRoutes.routes,
                    theme: AppThemes.lightTheme(),
                    darkTheme: AppThemes.darkTheme(),
                    initialRoute: user==null?ChooseRoleRole.route:(){
                      if(user.role.isArtist){
                        return NavArtistScreen.route;
                      }
                      return NavClientScreen.route;
                    }(),
                    builder: (context, widget) {
                      return MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(textScaler: TextScaler.linear(1.0)),
                        child: widget ?? const SizedBox(),
                      );
                    },
                  ),
                ),
          );
        },
      ),
    );
  }
}
