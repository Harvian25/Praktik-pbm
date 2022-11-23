import 'package:tugaspraktikum6/shared/widgets/button_widget.dart';
import 'package:tugaspraktikum6/shared/widgets/simple_text_widget.dart';
import 'package:tugaspraktikum6/shared/widgets/text_form_field_widget.dart';
import 'package:tugaspraktikum6/signup/controllers/signup_controller.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  final SignUpController signUpController;
  const SignUpPage({
    super.key,
    required this.signUpController,
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState(signUpController);
}

class _SignUpPageState extends State<SignUpPage> {
  final SignUpController signUpController;

  _SignUpPageState(this.signUpController);

  bool obsecureTextPassword = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 153, 121, 209),
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text("Registrasi"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const SimpleTextWidget(
                  textditerima: "Konfirmasi data anda",
                  textSize: 30,
                  TextDiterima: '',
                ),
                const SizedBox(height: 30),
                TextFormFieldWidget(
                  enabled: true,
                  label: "Nama",
                  obscureText: false,
                  readOnly: false,
                  icon: Icons.text_format,
                  hint: "Masukan nama depan anda",
                  onChanged: (nomeDigitado) {
                    signUpController.setName(nomeDigitado);
                  },
                  validator: (nama) {
                    if (nama == null || nama.isEmpty) {
                      return "nama wajib di isi";
                    }
                    if (nama.length <= 2) {
                      return "Nama Harus lebih dari 3 huruf";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                TextFormFieldWidget(
                  enabled: true,
                  label: "Nama tengah",
                  obscureText: false,
                  readOnly: false,
                  icon: Icons.text_format,
                  hint: "masukan nama belakang",
                  onChanged: (NamaBelakangdiMasukan) {
                    signUpController.setLastName(NamaBelakangdiMasukan);
                  },
                  validator: (NamaBelakang) {
                    if (NamaBelakang == null || NamaBelakang.isEmpty) {
                      return "Nama belakang wajib di isi";
                    }
                    if (NamaBelakang.length <= 2) {
                      return "Nama belakang wajib di isi lebih dari 3 huruf";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                TextFormFieldWidget(
                  enabled: true,
                  label: "E-mail",
                  obscureText: false,
                  readOnly: false,
                  icon: Icons.email,
                  hint: "Masukan email",
                  onChanged: (emailyangdiMasukan) {
                    signUpController.setEmail(emailyangdiMasukan);
                  },
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return "email wajib di isi";
                    }

                    if (!signUpController.emailValidRegexp) {
                      return "email tidak valid";
                    }

                    return null;
                  },
                ),
                ValueListenableBuilder(
                  valueListenable: signUpController.$emailIsValidMessage,
                  builder: (_, __, ___) {
                    return !signUpController.emailIsValidMessage
                        ? const SimpleTextWidget(
                            TextDiterima: "Email sudah terdaftar!!",
                            textSize: 15,
                            textColor: Color.fromARGB(255, 192, 31, 19),
                            textditerima: '',
                          )
                        : const SizedBox();
                  },
                ),
                const SizedBox(height: 30),
                TextFormFieldWidget(
                  enabled: true,
                  label: "Kata Sandi, Bukan kata udin",
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
                  hint: "Masukan kata sandi",
                  onChanged: (sandiYangdimasukan) {
                    signUpController.setPassword(sandiYangdimasukan);
                  },
                  validator: (sandi) {
                    if (sandi == null || sandi.isEmpty) {
                      return "Kata Sandi wajib di isi";
                    }

                    if (sandi.toString().length < 6) {
                      return "Kata sandi minimal 5 karakter";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                ValueListenableBuilder(
                  valueListenable: signUpController.$btnIsValid,
                  builder: (_, __, ___) {
                    return ButtonWidget(
                        textButton: "Register akun",
                        colorButton: Colors.deepPurple,
                        isBtnDisabled: !signUpController.btnIsValid,
                        onPressed: signUpController.btnIsValid
                            ? () {
                                signUpController.signUp(context);
                              }
                            : null);
                  },
                ),
                const SizedBox(height: 30),
                SimpleTextWidget(
                  TextDiterima: "Klik untuk register",
                  onSimpleTap: () {
                    signUpController.goToLoginPage(context);
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
