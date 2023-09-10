import 'package:share_plus/share_plus.dart';

class ShareController {

  //Share Text
  void onShareTextMsg({required String msg,String subject = ''}) =>
      Share.share(msg, subject: subject);

  //Share Files
  void onShareFiles({required List<String> files,String msg = '',String subject = ''}) =>
      Share.shareFiles(files, subject: subject,text: msg);

  //Share X Files
  Future<void> onShareXFiles({required List<XFile> files,String msg = '',String subject = ''}) async =>
      await Share.shareXFiles(files, subject: subject,text: msg);
}
