import 'package:flutter/material.dart';

class AppConst{
   // Colors Scheme
   static const Color greyColor = Color(0xFFf7f7f7);
   static const Color lightBlueColor = Color(0xFFB2D6FF);
   static const Color orangeColor = Color(0xFFFF9F5A);
   static const Color yellowColor = Color(0xFFFFCA3C);
   static const Color blueColor = Color(0xFF07AEC0);
   static const Color purpleColor = Color(0xFFA02EC1);
   static const Color whiteColor = Color(0xFFFFFFFF);
   static const Color violetColor = Color(0xFF6d60f8);
   static const Color blackColor = Color(0xff000000);

   // Font Scheme
   static const String fontDosis = 'Dosis';
   static const String fontOpenSans = 'OpenSans';
   static const String fontMontserrat = 'Montserrat';
   static const String fontPacifico = 'Pacifico';


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