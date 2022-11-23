import 'package:tugaspraktikum6/login/controllers/login_controller.dart';
import 'package:tugaspraktikum6/login/models/login_model.dart';
import 'package:tugaspraktikum6/login/pages/login_page.dart';
import 'package:tugaspraktikum6/login/repositories/login_repository.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register dan Login',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: LoginPage(
        judulHalaman: "Login",
        loginController: LoginController(
          LoginRepository(
            LoginModel(),
          ),
        ),
      ),
    );
  }
}
