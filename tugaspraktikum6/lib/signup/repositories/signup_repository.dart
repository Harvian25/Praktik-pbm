import 'package:tugaspraktikum6/signup/models/signup_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SignUpRepository {
  final SignUpModel signUpModel;
  SignUpRepository(
    this.signUpModel,
  );

  var userList = List<String>.from([]);

  Future<bool> signUp(SignUpModel signUpModelReceived) async {
    bool userExists = false;
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getStringList("users") != null) {
      userList = prefs.getStringList("users")!;

      for (var usr in userList) {
        Map<String, dynamic> valueMap = json.decode(usr);
        SignUpModel userModel = SignUpModel.fromJson(valueMap);

        if (userModel.email == signUpModelReceived.email) {
          userExists = true;
          break;
        } else {
          userExists = false;
        }
      }

      if (!userExists) {
        try {
          var encodedString = jsonEncode(signUpModelReceived);
          userList.add(encodedString);
          prefs.setStringList("users", userList);
          return true;
        } catch (e) {
          print("Terjadi Kesalahan: $e");
          return false;
        }
      } else {
        return false;
      }
    } else {
      var encodedString = jsonEncode(signUpModelReceived);
      userList.add(encodedString);
      prefs.setStringList("users", userList);
      return true;
    }
  }
}
