import 'package:get_it/get_it.dart';
import 'package:hather_app/src/services/s_auth.dart';
import 'package:hather_app/src/utils/local/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerSingleton<Preferences>(Preferences(sharedPreferences));
  getIt.registerSingleton<SAuth>(SAuth(getIt<Preferences>()));

}
