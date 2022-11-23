import 'package:tugaspraktikum6/login/models/login_model.dart';
import 'package:tugaspraktikum6/signup/models/signup_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LoginRepository {
  final LoginModel loginModel;
  LoginRepository(this.loginModel);

  var userList = List<String>.from([]);

  Future<bool> loginRepository(LoginModel loginModel) async {
    final prefs = await SharedPreferences.getInstance();
    bool loginIsOk = false;
    if (prefs.getStringList("users") != null) {
      userList = prefs.getStringList("users")!;

      for (var usr in userList) {
        Map<String, dynamic> valueMap = json.decode(usr);
        SignUpModel userModel = SignUpModel.fromJson(valueMap);

        if ((userModel.email == loginModel.email) &&
            (userModel.password == loginModel.password)) {
          loginIsOk = true;
          break;
        } else {
          loginIsOk = false;
        }
      }
    } else {
      loginIsOk = false;
    }
    return loginIsOk;
  }
}
