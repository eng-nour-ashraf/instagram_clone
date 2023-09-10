import 'package:get/get.dart' as gt;

import '../../../app/log/log_controller.dart';


class FavouriteController extends gt.GetxController {

  //  controllers
  LogController logController = gt.Get.find();

  //***************************************************************************************************************

  //  variables

  //***************************************************************************************************************

  //  status

  @override
  void onInit() {
    logController.onRed(msg: 'init Favourite');
    super.onInit();
  }

  @override
  void onReady() {
    logController.onRed(msg: 'ready Favourite');
    super.onReady();
  }

  @override
  void onClose() {
    logController.onRed(msg: 'close Favourite');
    super.onClose();
  }

//***************************************************************************************************************

//  methods

}
