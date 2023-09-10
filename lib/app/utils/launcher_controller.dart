import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LauncherController {
  //Launch Url
  Future<bool> onLaunchUrl({required String url}) async =>
      await canLaunchUrlString(url)
          ? await launchUrlString(url)
          : throw 'Could not launch $url';

  //Launch Whatsapp
  Future<bool> onLaunchWhatsApp(
          {required String phone, required String msg}) async =>
      await canLaunchUrlString('whatsapp://send?phone=$phone&text=$msg')
          ? await launchUrlString('whatsapp://send?phone=$phone&text=$msg')
          : throw 'Could not launch whatsapp://send?phone=$phone&text=$msg';

  //Call Phone
  Future<bool> onLaunchPhone({required String phone}) async =>
      await canLaunchUrlString('tel:$phone')
          ? await launchUrlString('tel:$phone')
          : throw 'Could not call $phone';

  //Send Mail
  Future<bool> onLaunchMail(
          {required String email,
          required String subject,
          required String body}) async =>
      await canLaunchUrlString('mailto:$email?subject=$subject&body=$body')
          ? await launchUrlString('mailto:$email?subject=$subject&body=$body')
          : throw 'Could not send email to $email';

  //Send SMS
  Future<bool> onLaunchSMS({required String phone}) async =>
      await canLaunchUrlString('sms:$phone')
          ? await launchUrlString('sms:$phone')
          : throw 'Could not call $phone';
}
