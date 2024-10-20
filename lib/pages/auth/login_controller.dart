import 'package:ftl_dery/pages/auth/repo.dart';
import 'package:ftl_dery/pages/auth/sign_in.dart';
import 'package:ftl_dery/pages/home/home_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  // Buat instance GetStorage

  final GetStorage _box = GetStorage();

  // RxBool untuk status login
  var isLoggedIn = false.obs;

  // Key untuk menyimpan login status di GetStorage
  final String _isLoggedInKey = 'isLoggedIn';

  @override
  void onInit() {
    super.onInit();
    // Cek status login dari GetStorage
    isLoggedIn.value = _box.read(_isLoggedInKey) ?? false;
  }

  // Fungsi untuk login

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> logins(String username, String password) async {
    // Panggil service postLogin
    final response = await Repo.postLogin(username, password);

    // Jika berhasil (status code 200)
    print({response});
    if (response == 200) {
      print('Login success! Token: ');
      isLoggedIn.value = true;
      _box.write(_isLoggedInKey, true); // Simpan status login di GetStorage
      Get.offAll(HomePage());
    } else {
      // Tampilkan pesan error jika login gagal
      errorMessage.value = 'Login failed';
      Get.snackbar('Error', errorMessage.value,
          snackPosition: SnackPosition.BOTTOM);
    }

    isLoading.value = false; // Matikan loading setelah selesai
  }

  // Fungsi untuk logout
  void logout() {
    isLoggedIn.value = false;
    _box.write(_isLoggedInKey, false); // Hapus status login di GetStorage
    Get.offAll(SignInPage()); // Pindah ke halaman Login
  }
}
