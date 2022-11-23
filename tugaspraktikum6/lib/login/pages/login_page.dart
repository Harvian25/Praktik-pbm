import 'package:tugaspraktikum6/login/controllers/login_controller.dart';
import 'package:tugaspraktikum6/shared/widgets/button_widget.dart';
import 'package:tugaspraktikum6/shared/widgets/simple_text_widget.dart';
import 'package:tugaspraktikum6/shared/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String judulHalaman;
  final LoginController loginController;

  const LoginPage({
    super.key,
    required this.judulHalaman,
    required this.loginController,
  });

  @override
  State<LoginPage> createState() => _LoginPageState(
        judulHalaman,
        loginController,
      );
}

class _LoginPageState extends State<LoginPage> {
  final LoginController loginController;
  final String judulHalaman;

  bool obsecureTextPassword = true;
  _LoginPageState(
    this.judulHalaman,
    this.loginController,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 126, 141, 226),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(judulHalaman),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const SimpleTextWidget(
                  TextDiterima: "Login",
                  textSize: 30,
                  textditerima: '',
                ),
                const SizedBox(height: 30),
                TextFormFieldWidget(
                  enabled: true,
                  label: "E-mail",
                  obscureText: false,
                  readOnly: false,
                  icon: Icons.email,
                  hint: "Konfirmasi email anda",
                  onChanged: (emailDiMasukan) {
                    loginController.setEmail(emailDiMasukan);
                  },
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return "Wajib Masukan Email! karna bukan sunah?";
                    }

                    if (!loginController.emailValidRegexp) {
                      return "Email Tidak Valid!";
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 30),
                TextFormFieldWidget(
                  enabled: true,
                  label: "Kata Sandi",
                  obscureText: obsecureTextPassword ? true : false,
                  readOnly: false,
                  icon: Icons.key,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obsecureTextPassword = !obsecureTextPassword;
                      });
                    },
                    icon: Icon(
                      obsecureTextPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                  hint: "Konfirmasi kata sandi",
                  onChanged: (SandiDimasukan) {
                    loginController.setPassword(SandiDimasukan);
                  },
                  validator: (sandi) {
                    if (sandi == null || sandi.isEmpty) {
                      return "Wajib masukan kata sandi";
                    }

                    if (sandi.toString().length < 6) {
                      return "kata sandi minimal 6 karakter, bukan kata rama";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                ValueListenableBuilder(
                  valueListenable: loginController.$failOnLogin,
                  builder: (_, __, ___) {
                    return loginController.failOnLogin
                        ? Column(
                            children: const [
                              SimpleTextWidget(
                                TextDiterima: "email dan kata sandi invalid",
                                textSize: 18,
                                textColor: Color.fromARGB(255, 208, 27, 14),
                                textditerima: '',
                              ),
                              SizedBox(height: 10),
                            ],
                          )
                        : const SizedBox();
                  },
                ),
                ValueListenableBuilder(
                  valueListenable: loginController.$btnIsValid,
                  builder: (_, __, ___) {
                    return ButtonWidget(
                        textButton: "mengakses",
                        colorButton: Colors.indigo,
                        isBtnDisabled: !loginController.btnIsValid,
                        onPressed: loginController.btnIsValid
                            ? () {
                                loginController.login(context);
                              }
                            : null);
                  },
                ),
                const SizedBox(height: 50),
                SimpleTextWidget(
                  textSize: 18,
                  TextDiterima: "Klik untuk membuat akun",
                  onSimpleTap: () {
                    loginController.goToSignUpPage(context);
                  },
                  textditerima: '',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
