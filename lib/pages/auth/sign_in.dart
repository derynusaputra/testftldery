import 'package:flutter/material.dart';
import 'package:ftl_dery/pages/auth/login_controller.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller =
        Get.put(LoginController()); // Inisialisasi LoginController
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
        // appBar: AppBar(title: Text('MyPage')),
        body: Center(
      child: Container(
        // decoration: Decoration.,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Panggil fungsi login
                // controller.login(
                //     usernameController.text, passwordController.text);

                controller.logins(
                    usernameController.text, passwordController.text);
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    ));
  }
}
