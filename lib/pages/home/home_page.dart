import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ftl_dery/pages/auth/login_controller.dart';
import 'package:ftl_dery/pages/auth/repo.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeadWidget(),
            ElevatedButton(
              onPressed: () {
                // Panggil fungsi login
                controller.logout();
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

class HeadWidget extends StatelessWidget {
  const HeadWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 34.r,
              // backgroundColor: Colors.red,
              child: Text(
                "Y",
              ),
            ),
            Center(
              child: Text("Home"),
            ),
          ],
        ),
      ],
    );
  }
}
