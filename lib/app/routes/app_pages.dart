import 'package:get/get.dart';
import 'package:instagram_clone/modules/pages/comments/comments_view.dart';
import 'package:instagram_clone/modules/pages/home/home_view.dart';

import '../../modules/pages/login/login_view.dart';
import '../../modules/pages/register/register_view.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterView(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
    ),
    GetPage(
      name: Routes.comments,
      fullscreenDialog: true,
      page: () => const CommentsView(),
    ),
  ];
}
