import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../app/theme/app_colors.dart';
import '../../app/translations/locale_keys.dart';


class AppLoadingWidget extends StatelessWidget {
  final double size;
  final String text;
  final bool withText;
  final double textFontSize;
  final double textLoadingSpace;
  final EdgeInsetsGeometry loadingPadding;
  final MainAxisAlignment mainAxisAlignment;
  final Color color;

  const AppLoadingWidget(
      {Key? key,
      this.color = AppColor.colorWhite,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.text = LocalKeys.loading,
      this.textFontSize = 20,
      this.textLoadingSpace = 15,
      this.withText = false,
      this.size = 70,
      this.loadingPadding = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Padding(
          padding: loadingPadding,
          child: SpinKitSpinningLines(
            color: color,
            size: size,
          ),
        ),
        SizedBox(
          height: withText ? textLoadingSpace : 0,
        ),
        withText
            ? Text(
                text.tr,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: textFontSize,
                    color: AppColor.colorBlack),
              )
            : Container(),
      ],
    );
  }
}
