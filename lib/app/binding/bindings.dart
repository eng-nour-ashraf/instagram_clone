import 'package:get/get.dart';
import 'package:instagram_clone/app/fcm/firebase_auth_controller.dart';
import 'package:instagram_clone/app/fcm/firebase_storage_controller.dart';
import 'package:instagram_clone/modules/pages/comments/comments_controller.dart';
import 'package:instagram_clone/modules/pages/favourite/favourite_controller.dart';
import 'package:instagram_clone/modules/pages/home/home_controller.dart';
import 'package:instagram_clone/modules/pages/main/main_controller.dart';
import 'package:instagram_clone/modules/pages/profile/profile_controller.dart';
import 'package:instagram_clone/modules/pages/register/register_controller.dart';
import 'package:instagram_clone/modules/pages/search/search_controller.dart';


import '../../modules/pages/add_post/add_post_controller.dart';
import '../../modules/pages/login/login_controller.dart';
import '../../modules/pages/users_profile/users_profile_controller.dart';
import '../alerts/dialog_controller.dart';
import '../alerts/snackbar_controller.dart';
import '../fcm/firebase_firestore_controller.dart';
import '../log/log_controller.dart';
import '../media/image_picker_controller.dart';
import '../network/config/api_controller.dart';
import '../pref/pref_controller.dart';
import '../theme/theme_controller.dart';
import '../translations/localization_controller.dart';
import '../utils/launcher_controller.dart';
import '../utils/share_controller.dart';
import '../utils/time_date_controller.dart';
import '../utils/utils_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {

    // app

    Get.put(LogController(),permanent: true);
    Get.lazyPut(() => ApiController(), fenix: true);
    Get.lazyPut(() => ThemeController(), fenix: true);
    Get.lazyPut(() => LocalizationController(), fenix: true);
    Get.lazyPut(() => PrefController(), fenix: true);
    Get.lazyPut(() => UtilsController(), fenix: true);
    Get.lazyPut(() => ShareController(), fenix: true);
    Get.lazyPut(() => LauncherController(), fenix: true);
    Get.lazyPut(() => TimeDateController(), fenix: true);
    Get.lazyPut(() => ImagePickerController(), fenix: true);
    Get.lazyPut(() => DialogController(), fenix: true);
    Get.lazyPut(() => SnackBarController(), fenix: true);
    Get.lazyPut(() => FirebaseFireStoreController(), fenix: true);
    Get.lazyPut(() => FirebaseAuthController(), fenix: true);
    Get.lazyPut(() => FirebaseStorageController(), fenix: true);

    // modules

    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => RegisterController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => MainController(), fenix: true);
    Get.lazyPut(() => SearchViewController(), fenix: true);
    Get.lazyPut(() => AddPostController(), fenix: true);
    Get.lazyPut(() => FavouriteController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true,);
    Get.lazyPut(() => CommentsController(), fenix: true);
    Get.lazyPut(() => UsersProfileController(),fenix: true);
  }
}
