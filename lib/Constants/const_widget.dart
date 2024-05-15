import 'package:flutter/material.dart';

class AppConst {
  // Colors Scheme
  static const Color greyColor = Color(0xFFf7f7f7);
  static const Color greyColor1 = Color(0xFFf4f4f4);
  static const Color greyColor2 = Color(0xFFa6a6a6);
  static const Color lightBlueColor = Color(0xFFB2D6FF);
  static const Color orangeColor = Color(0xFFFF9F5A);
  static const Color yellowColor = Color(0xFFFFCA3C);
  static const Color blueColor = Color(0xFF07AEC0);
  static const Color purpleColor = Color(0xFFA02EC1);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color violetColor = Color(0xFF6d60f8);
  static const Color blackColor = Color(0xff000000);
  static const Color seablueColor = Color(0xFF1A8FB0);
  static const Color seagreenColor = Color(0xFF31C598);
  static const Color seafoamColor = Color(0xFF9FE2BF);
  static const Color midnightblueColor = Color(0xFF1C1678);
  static const Color samplecolor = Color(0xFFE3F2FD);
  static const Color tealColor =Color.fromRGBO(3, 168, 166, 1.0);
  static const Color darkTealColor = Color(0xFF07787C);
  static const Color yellow1Color= Color(0xFFe3b232)  ;
  static const Color yellow2Color= Color(0xFFe0cd59)  ;


  // Font Scheme
  static const String fontDosis = 'Dosis';
  static const String fontOpenSans = 'OpenSans';
  static const String fontMontserrat = 'Montserrat';
  static const String fontPacifico = 'Pacifico';
  static const String fontIbmPlex = 'IbmPlex';
  static const String fontCookie = 'Cookie';
  static const String fontBorel = 'Borel';

  static void showSimpleToast(BuildContext context, String message,
      {int duration = 4}) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.hideCurrentSnackBar();
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: duration),
      action: SnackBarAction(
        label: 'HIDE',
        onPressed: scaffold.hideCurrentSnackBar,
      ),
    );
    scaffold.showSnackBar(snackBar);
  }
}
