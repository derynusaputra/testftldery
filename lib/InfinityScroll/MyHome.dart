import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ftl_dery/InfinityScroll/controllers/user_controller.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final UserController state = Get.put(UserController());

    Future onRefresh() async {
      state.refreshData();
    }

    void onScroll() {
      print("object ${scrollController.positions}");

      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;

      if (maxScroll == currentScroll && state.hasMore.value) {
        state.getUser();
      }
    }

    //pertama di jalankan
    state.getUser();
    scrollController.addListener(onScroll);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(""),
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: Obx(() => ListView.builder(
            controller: scrollController,
            itemCount: state.hasMore.value
                ? state.users.length + 1
                : state.users.length,
            itemBuilder: (context, index) {
              if (index < state.users.length) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(state.users[index].avatar ?? ''),
                  ),
                  title: Text(state.users[index].name ?? ''),
                  subtitle: Text(state.users[index].email ?? ''),
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.all(15),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
                );
              }
            })),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ListViewBuil extends StatelessWidget {
  const ListViewBuil({
    super.key,
    required this.scrollController,
    required this.state,
  });

  final ScrollController scrollController;
  final UserController state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scrollController,
        itemCount:
            state.hasMore.value ? state.users.length + 1 : state.users.length,
        itemBuilder: (context, index) {
          if (index < state.users.length) {
            return ListTile(
              leading: CircleAvatar(
                radius: 34.r,
                backgroundColor: Colors.red,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1506277886164-e25aa3f4ef7f?q=80&w=3435&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
              ),
              title: Text(GetUtils.hasMatch("tAi", "tai").toString()),
              subtitle: Text(state.users[index].email ?? ''),
            );
          } else {
            return const Padding(
              padding: EdgeInsets.all(15),
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              ),
            );
          }
        });
  }
}
