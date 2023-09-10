import 'package:get/get.dart' as gt;

import '../../../app/log/log_controller.dart';


class ProfileController extends gt.GetxController {

  //  controllers
  LogController logController = gt.Get.find();

  //***************************************************************************************************************

  //  variables

  //***************************************************************************************************************

  //  status

  @override
  void onInit() {
    logController.onRed(msg: 'init Profile');
    super.onInit();
  }

  @override
  void onReady() {
    logController.onRed(msg: 'ready Profile');
    super.onReady();
  }

  @override
  void onClose() {
    logController.onRed(msg: 'close Profile');
    super.onClose();
  }

//***************************************************************************************************************

//  methods

}
