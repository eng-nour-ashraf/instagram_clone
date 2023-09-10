import 'package:get/get.dart' as gt;

import '../../../app/log/log_controller.dart';


class SearchController extends gt.GetxController {

  //  controllers
  LogController logController = gt.Get.find();

  //***************************************************************************************************************

  //  variables

  //***************************************************************************************************************

  //  status

  @override
  void onInit() {
    logController.onRed(msg: 'init Search');
    super.onInit();
  }

  @override
  void onReady() {
    logController.onRed(msg: 'ready Search');
    super.onReady();
  }

  @override
  void onClose() {
    logController.onRed(msg: 'close Search');
    super.onClose();
  }

//***************************************************************************************************************

//  methods

}
