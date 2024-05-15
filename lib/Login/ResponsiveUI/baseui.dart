import 'package:demoproject/Constants/images.dart';
import 'package:flutter/material.dart';

import '../../Constants/const_widget.dart';

class Baseui extends StatelessWidget {
  final Widget widget;

  // final Widget text;

  const Baseui({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    final heightMQ = MediaQuery.of(context).size.height;
    final widthMQ = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppConst.blackColor,
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
            height: heightMQ * 0.35,
            width: widthMQ,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImagesPath.background),
                    fit: BoxFit.fill)),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: const Alignment(-1, 1),
                  child: Container(
                    height: heightMQ * 0.2,
                    width: widthMQ * 0.2,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(ImagesPath.mic1))),
                  ),
                ),
                Align(
                  alignment: const Alignment(1, -1),
                  child: Container(
                    height: heightMQ * 0.25,
                    width: widthMQ * 0.25,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(ImagesPath.mic2))),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 20,
                  right: 20,
                  child: Container(
                    height: heightMQ * 0.3,
                    width: widthMQ * 0.3,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(ImagesPath.appLogoDark))),
                  ),
                ),
              ],
            ),
          ),
          widget
        ],
      )),
    );
  }
}
