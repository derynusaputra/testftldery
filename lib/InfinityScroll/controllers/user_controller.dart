import 'package:flutter/foundation.dart';
import 'package:ftl_dery/InfinityScroll/model/user.dart';
import 'package:ftl_dery/InfinityScroll/repository/user_repository.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();
  final int _limit = 15;
  int _page = 1;
  var hasMore = true.obs;
  var users = <User>[].obs;

  Future getUser() async {
    try {
      List<User> response = await _userRepository.fetchUsers(_page, _limit);

      if (response.length < _limit) {
        hasMore.value = false;
      }

      users.addAll(response);
      _page++;
    } catch (e) {
      if (kDebugMode) print(e.toString());
    }
  }

  Future refreshData() async {
    _page = 1;
    hasMore.value = true;
    users.value = [];

    await getUser();
  }
}
