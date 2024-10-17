import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ftl_dery/pages/auth/login_controller.dart';
import 'package:ftl_dery/pages/auth/repo.dart';
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
        child: ListView(
          children: [
            SizedBox(
              height: 50.w,
            ),
            Center(
              child: Text(
                "Ruangan Meeting",
                style: TextStyle(fontSize: 30.w, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 100.w,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 13.w),
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              width: 300.w,
              height: 301.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(17.r)),
                  color: Color(0xffECECEC)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign In",
                    style: TextStyle(fontSize: 22.w, color: Colors.black),
                  ),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (usernameController.text != "" &&
                          usernameController.text != "") {
                        controller.logins(
                            usernameController.text, passwordController.text);
                      } else {
                        Get.snackbar(
                            "Warning", "Username dan Password Wajib diisi");
                      }
                    },
                    child: Text('Sign In'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
