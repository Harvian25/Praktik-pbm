// ignore_for_file: avoid_print
import 'package:tugaspraktikum6/home/pages/home_page.dart';
import 'package:tugaspraktikum6/login/models/login_model.dart';
import 'package:tugaspraktikum6/login/repositories/login_repository.dart';
import 'package:tugaspraktikum6/signup/controllers/signup_controller.dart';
import 'package:tugaspraktikum6/signup/models/signup_model.dart';
import 'package:tugaspraktikum6/signup/pages/signup_page.dart';
import 'package:tugaspraktikum6/signup/repositories/signup_repository.dart';
import 'package:flutter/material.dart';

class LoginController {
  final LoginRepository loginRepository;
  LoginController(this.loginRepository);

  String email = "";
  String password = "";
  bool emailIsValid = false;
  bool passwordIsValid = false;
  bool emailValidRegexp = false;

  ValueNotifier<bool> $btnIsValid = ValueNotifier(false);
  bool get btnIsValid => $btnIsValid.value;
  set setBtnIsValid(bool captured) => $btnIsValid.value = captured;

  ValueNotifier<bool> $failOnLogin = ValueNotifier(false);
  bool get failOnLogin => $failOnLogin.value;
  set setFailOnLogin(bool captured) => $failOnLogin.value = captured;

  setEmail(emailReceived) {
    email = emailReceived;

    email.isNotEmpty ? emailIsValid = true : emailIsValid = false;

    emailValidRegexp = RegExp(r"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$")
        .hasMatch(email);

    emailValidRegexp ? emailIsValid = true : emailIsValid = false;

    failOnLogin ? setFailOnLogin = false : null;

    validaLogin();
  }

  setPassword(passwordReceived) {
    password = passwordReceived;

    password.isNotEmpty ? passwordIsValid = true : passwordIsValid = false;

    password.toString().length < 6
        ? passwordIsValid = false
        : passwordIsValid = true;

    failOnLogin ? setFailOnLogin = false : null;

    validaLogin();
  }

  validaLogin() {
    (emailIsValid && passwordIsValid)
        ? setBtnIsValid = true
        : setBtnIsValid = false;
  }

  Future login(BuildContext context) async {
    LoginModel loginModel = LoginModel();
    loginModel.email = email;
    loginModel.password = password;

    bool loginIsValid = await loginRepository.loginRepository(loginModel);

    if (loginIsValid) {
      setFailOnLogin = false;

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomePage()));
    } else {
      setFailOnLogin = true;
    }
  }

  goToSignUpPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SignUpPage(
          signUpController: SignUpController(
            SignUpRepository(
              SignUpModel(),
            ),
          ),
        ),
      ),
    );
  }
}
