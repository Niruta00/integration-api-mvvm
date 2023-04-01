import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:reqres_api_integration/respository/auth_repo.dart';
import 'package:reqres_api_integration/utils/routes/routes_name.dart';
import 'package:reqres_api_integration/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  SetLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> registerApi(dynamic data, BuildContext context) async {
    SetLoading(true);

    _myRepo.requestApi(data).then((value) {
      print(value);
      SetLoading(false);
      Utils.flushBarErrorMessage('LogIn sucessfully', context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      print("error is $error");
      SetLoading(false);

      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);

        print(error.toString());
      }
    });
  }
}
