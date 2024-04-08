import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:hather_app/src/models/user.dart';
import 'package:hather_app/src/services/s_auth.dart';
import 'package:hather_app/src/services/s_home.dart';
import 'package:hather_app/src/utils/di/services_locator.dart';
import 'package:provider/provider.dart';

class CHome extends ChangeNotifier {
  static CHome get(BuildContext context) =>
      Provider.of<CHome>(context, listen: false);
  final _sHome = getIt<SHome>();

  Future<String> uploadImage(String imagePath) async {
    try {
      // Call the register method from SAuth service
      final result = await _sHome.uploadImage(imagePath);
      if (result.isRight) {
        //get message from result
        final message = result.fold((l) => l, (r) => r['Message']);
        return message;
      }
      return result.fold((l) => l, (r) => r);
    } catch (e) {
      return e.toString();
    }
  }
}
