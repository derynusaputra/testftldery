import 'package:ftl_dery/InfinityScroll/model/user.dart';
import 'package:get/get.dart';
// import 'package:infinite_pagination_getx/models/user.dart';

class UserRepository extends GetConnect {
  final String _baseUrl =
      'https://61a9cb9833e9df0017ea3f42.mockapi.io/api/foc/users';

  // https://61a9cb9833e9df0017ea3f42.mockapi.io/api/foc/users?page=3&limit=2

  Future<List<User>> fetchUsers(int page, int limit) async {
    final response = await get(_baseUrl);

    print(response.statusCode);
    final data = response.body;
    return List<User>.from(data.map((e) => User.fromJson(e)));
  }
}
