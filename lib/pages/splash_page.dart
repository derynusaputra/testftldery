import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ftl_dery/pages/auth/sign_in.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('MyPage')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Text("Selamat Datang\nDi Aplikasi Ruang Meeting "),
              ElevatedButton(
                  onPressed: () => {Get.to(SignInPage())}, child: Text("Next"))
            ],
          ),
        ));
  }
}
