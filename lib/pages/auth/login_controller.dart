import 'package:ftl_dery/pages/auth/repository_login.dart';
import 'package:ftl_dery/pages/auth/sign_in.dart';
import 'package:ftl_dery/pages/home/home_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  // Buat instance GetStorage
  final ApiService apiService = ApiService();
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
  void login(String username, String password) {
    if (username == 'yosi@gmail.com' && password == 'password') {
      isLoggedIn.value = true;
      _box.write(_isLoggedInKey, true); // Simpan status login di GetStorage
      Get.offAll(HomePage()); // Pindah ke halaman Home
    } else {
      Get.snackbar('Error', 'Invalid username or password',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  Future<void> logins(String username, String password) async {
    // Panggil service postLogin
    final response = await apiService.postLogin(username, password);

    // Jika berhasil (status code 200)
    if (response.statusCode == 200) {
      print('Login success! Token: ');
      isLoggedIn.value = true;
      _box.write(_isLoggedInKey, true); // Simpan status login di GetStorage
      Get.offAll(HomePage());
    } else {
      // Tampilkan pesan error jika login gagal
      errorMessage.value = response.statusText ?? 'Login failed';
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
