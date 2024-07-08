
import 'package:flutter/material.dart';

class TSizes {



// Define MediaQuery constants
  static final heightMQ = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.single).size.height;
  static final widthMQ = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.single).size.width;
  static final aspectRatioMQ = MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.single).size.aspectRatio;


}



