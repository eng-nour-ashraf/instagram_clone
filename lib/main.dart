import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/binding/bindings.dart';
import 'app/fcm/firebase_options.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/theme/app_theme.dart';
import 'app/translations/app_translations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Http Configure
  if(!kIsWeb){
    ByteData data =
    await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
    SecurityContext.defaultContext
        .setTrustedCertificatesBytes(data.buffer.asUint8List());
  }

  // FCM
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // pref init
  await GetStorage.init();

  // run app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // init storage
  final GetStorage getStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    // init Route
    var initRoute = Routes.login;
   if (FirebaseAuth.instance.currentUser != null){
      initRoute = Routes.home;
   }

    return GetMaterialApp(
      title: 'Instagram Clone',
      debugShowCheckedModeBanner: false,
      translationsKeys: AppTranslation.translations,
      locale: Locale(getStorage.read('currentLocale') ?? 'en', ''),
      fallbackLocale: const Locale('en', ''),
      initialBinding: AppBindings(),
      defaultTransition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      getPages: AppPages.routes,
      initialRoute: initRoute,
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
      unknownRoute: GetPage(
        page: () => const Text('Unknown Route!'),
        name: '/unknown',
      ),
    );
  }
}
