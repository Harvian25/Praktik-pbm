import 'package:tugaspraktikum6/login/controllers/login_controller.dart';
import 'package:tugaspraktikum6/login/models/login_model.dart';
import 'package:tugaspraktikum6/login/pages/login_page.dart';
import 'package:tugaspraktikum6/login/repositories/login_repository.dart';
import 'package:tugaspraktikum6/shared/widgets/button_widget.dart';
import 'package:tugaspraktikum6/shared/widgets/simple_text_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 188, 186, 182),
      appBar: AppBar(
        title: const Text("Mulai"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SimpleTextWidget(
              TextDiterima: "Anda Sudah Masuk!",
              textSize: 25,
              textColor: Colors.black,
              textditerima: '',
            ),
            const SizedBox(height: 20),
            ButtonWidget(
                colorButton: Colors.orangeAccent,
                textButton: "Logout",
                onPressed: () {
                  Navigator.pushReplacement(
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
                })
          ],
        ),
      ),
    );
  }
}
