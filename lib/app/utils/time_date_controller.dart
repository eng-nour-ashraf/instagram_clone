import 'package:flutter/material.dart';

import '../assets/assets.dart';

class TimeDateController {
  //Date
  Future<Map<String, dynamic>?> onSelectDate(
      {required BuildContext context,
        String helpText = '',
        String format = '-',
        DateTime? first,
        Color color = Colors.white,
        DateTime? last}) async {
    first ??= DateTime(1900);
    last ??= DateTime(2200);

    var picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: color,
            colorScheme:
            ColorScheme.light(primary: color),
            buttonTheme:
            const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            textTheme:  TextTheme(
              labelSmall: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: AppAssets.fontFamily,
              ),
              labelMedium: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: AppAssets.fontFamily,
              ),
              labelLarge: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: AppAssets.fontFamily,
              ),
            ),
          ),
          child: child!,
        );
      },
      helpText: helpText,
      context: context,
      firstDate: first,
      initialDate: DateTime.now(),
      lastDate: last,
    );

    if (picked != null) {
      var month = picked.month.toString();
      var day = picked.day.toString();
      var year = picked.year.toString();
      var totalDateApi = '$day$format$month$format$year';
      var date = DateTime(picked.year, picked.month, picked.day);
      return {
        'dateTime': date,
        'dateText': MaterialLocalizations.of(context).formatFullDate(picked),
        'dateApi': totalDateApi,
      };
    }
    return null;
  }

  //Time
  Future<Map<String, dynamic>?> onSelectTime(
      {required BuildContext context,
        String helpText = '',
        Color color = Colors.white,
        DateTime? first,
        DateTime? last}) async {
    var picked = await showTimePicker(
      helpText: helpText,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: color,
            colorScheme:
            ColorScheme.light(primary: color),
            buttonTheme:
            const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            textTheme:  TextTheme(
              labelSmall: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: AppAssets.fontFamily,
              ),
              labelMedium: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: AppAssets.fontFamily,
              ),
              labelLarge: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: AppAssets.fontFamily,
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      String minuteStr;
      String hourStr;
      String hour24Str;

      var minute = picked.minute;
      var hour = picked.hourOfPeriod;
      var hour24 = picked.hour;
      var period = picked.period.toString();
      if (minute < 10) {
        minuteStr = '0$minute';
      } else {
        minuteStr = '$minute';
      }

      if (hour < 10) {
        hourStr = '0$hour';
      } else {
        hourStr = '$hour';
      }

      if (hour24 < 10) {
        hour24Str = '0$hour24';
      } else {
        hour24Str = '$hour24';
      }

      period = period.split('.')[1];

      var totalDateApi = '$hourStr:$minuteStr $period';

      return {
        'timeText': MaterialLocalizations.of(context).formatTimeOfDay(picked),
        'timeApi': totalDateApi,
        'hour': hourStr,
        'hour24': hour24Str,
        'min': minuteStr,
      };
    }
    return null;
  }
}
