import 'package:buduar/features/auth/models/user_model.dart';
import 'package:buduar/features/auth/data/user_preferences.dart';
import 'package:get/get.dart';

class CurrentUser extends GetxController {
  final Rx<UserModel> _currentUser = UserModel(
    0,
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ).obs;
  final RxBool isLoading = true.obs;

  UserModel get user => _currentUser.value;

  @override
  void onInit() {
    super.onInit();
    getUserInfo();
    print("get user info");
  }

  getUserInfo() async {
    isLoading.value = true;
    UserModel? getUserInfoFromLocalStorage =
        await RememberUserPrefs.readUserInfo();
    if (getUserInfoFromLocalStorage != null) {
      _currentUser.value = getUserInfoFromLocalStorage;
    }
    isLoading.value = false;
  }
  void logout() {
    _currentUser.value = UserModel(0, '', '', '', '', '', '', '');
  }
}
