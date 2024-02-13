import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hather_app/src/controllers/c_user.dart';
import 'package:hather_app/src/utils/di/services_locator.dart';
import 'package:hather_app/src/views/auth/login_screen.dart';
import 'package:hather_app/src/views/auth/register_screen.dart';
import 'package:hather_app/src/views/auth/verify_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

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
      startLocale: Locale('en'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light),
    );

    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider<CUser>(create: (context) => CUser()..initial()),
        ],
        builder: (context, _) {
          final user=CUser.get(context).user;
          return FutureBuilder(
            future: Firebase.initializeApp(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) =>
                MaterialApp(
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  theme: ThemeData(fontFamily: 'IBMPlexSansCondensed'),
                  title: 'ArtX',
                  home: VerifyScreen(),
                ),
          );
        },
      ),
    );
  }
}
