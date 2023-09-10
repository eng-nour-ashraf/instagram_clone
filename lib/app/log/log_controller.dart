
import 'package:logger/logger.dart';

class LogController {
  Logger? logger;

  LogController() {
    logger = Logger(
        printer: PrettyPrinter(
          methodCount: 0,
          errorMethodCount: 5,
          lineLength: 50,
        )
    );
  }

  // log v
  void onGrey({required String msg}) => logger!.v(msg);

  // log d
  void onWhite({required String msg}) => logger!.d(msg);

  // log i
  void onBlue({required String msg}) => logger!.i(msg);

  // log w
  void onOrange({required String msg}) => logger!.w(msg);

  // log e
  void onRed({required String msg}) => logger!.e(msg);

}
