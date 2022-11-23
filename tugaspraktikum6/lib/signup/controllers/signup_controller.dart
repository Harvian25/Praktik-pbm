import 'package:tugaspraktikum6/login/controllers/login_controller.dart';
import 'package:tugaspraktikum6/login/models/login_model.dart';
import 'package:tugaspraktikum6/login/pages/login_page.dart';
import 'package:tugaspraktikum6/login/repositories/login_repository.dart';
import 'package:tugaspraktikum6/signup/models/signup_model.dart';
import 'package:tugaspraktikum6/signup/repositories/signup_repository.dart';
import 'package:flutter/material.dart';

class SignUpController {
  final SignUpRepository signUpRepository;
  SignUpController(
    this.signUpRepository,
  );

  String name = "";
  String lastName = "";
  String email = "";
  String password = "";
  bool nameIsValid = false;
  bool lastNameIsValid = false;

  bool emailIsValid = false;
  bool passwordIsValid = false;
  bool emailValidRegexp = false;

  ValueNotifier<bool> $btnIsValid = ValueNotifier(false);
  bool get btnIsValid => $btnIsValid.value;
  set setBtnIsValid(bool captured) => $btnIsValid.value = captured;

  ValueNotifier<bool> $emailIsValidMessage = ValueNotifier(true);
  bool get emailIsValidMessage => $emailIsValidMessage.value;
  set setEmailIsValidMessage(bool captured) =>
      $emailIsValidMessage.value = captured;

  setName(nameReceived) {
    name = nameReceived;

    name.isNotEmpty ? nameIsValid = true : nameIsValid = false;

    name.toString().length <= 2 ? nameIsValid = false : nameIsValid = true;

    validaSignUp();
  }

  setLastName(latNameReceived) {
    lastName = latNameReceived;

    lastName.isNotEmpty ? lastNameIsValid = true : lastNameIsValid = false;

    lastName.toString().length <= 2
        ? lastNameIsValid = false
        : lastNameIsValid = true;

    validaSignUp();
  }

  setEmail(emailReceived) {
    email = emailReceived;

    email.isNotEmpty ? emailIsValid = true : emailIsValid = false;

    emailValidRegexp = RegExp(r"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$")
        .hasMatch(email);

    emailValidRegexp ? emailIsValid = true : emailIsValid = false;

    !emailIsValidMessage ? setEmailIsValidMessage = true : null;

    validaSignUp();
  }

  setPassword(passwordReceived) {
    password = passwordReceived;

    password.isNotEmpty ? passwordIsValid = true : passwordIsValid = false;

    password.toString().length < 6
        ? passwordIsValid = false
        : passwordIsValid = true;

    validaSignUp();
  }

  validaSignUp() {
    (emailIsValid && passwordIsValid && nameIsValid && lastNameIsValid)
        ? setBtnIsValid = true
        : setBtnIsValid = false;
  }

  signUp(BuildContext context) async {
    SignUpModel signUpModel = SignUpModel();
    signUpModel.name = name;
    signUpModel.lastName = lastName;
    signUpModel.email = email;
    signUpModel.password = password;

    bool signUpResult = await signUpRepository.signUp(signUpModel);

    if (signUpResult) {
      setEmailIsValidMessage = signUpResult;
      goToLoginPage(context);
    } else {
      setEmailIsValidMessage = signUpResult;
    }
  }

  goToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => LoginPage(
          judulHalaman: "Login",
          loginController: LoginController(
            LoginRepository(
              LoginModel(),
            ),
          ),
        ),
      ),
    );
  }
}
