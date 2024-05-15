import 'package:demoproject/Constants/const_widget.dart';
import 'package:demoproject/Constants/images.dart';
import 'package:flutter/material.dart';

class UserBackground extends StatelessWidget {

  final Widget title;
  final Widget widget;

  const UserBackground(
      {super.key,
      required this.title,
      required this.widget});

  @override
  Widget build(BuildContext context) {
    final heightMQ = MediaQuery.of(context).size.height;
    final widthMQ = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: AppConst.blackColor,
        title: title,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,size: 30),
          onPressed: (){},
        ),
        flexibleSpace: Container(

          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage(ImagesPath.backgroundUser),
                  fit: BoxFit.fill)),
        ),
      ),
      backgroundColor: AppConst.blackColor,
      body: widget,
    );
  }
}
