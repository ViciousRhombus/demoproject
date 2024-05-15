import 'package:carousel_slider/carousel_slider.dart';
import 'package:demoproject/Constants/const_widget.dart';
import 'package:demoproject/Constants/images.dart';
import 'package:demoproject/User/Mobile/background.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class UserHomepageMobile extends StatefulWidget {
  const UserHomepageMobile({super.key});

  @override
  State<UserHomepageMobile> createState() => _UserHomepageMobileState();
}

class _UserHomepageMobileState extends State<UserHomepageMobile> {
  final CarouselController carouselController = CarouselController();
  int _carouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    final heightMQ = MediaQuery.of(context).size.height;
    final widthMQ = MediaQuery.of(context).size.width;
    return Scaffold(
        body: UserBackground(
      title: const Text(
        'Home',
        style: TextStyle(
            fontFamily: AppConst.fontMontserrat,
            fontWeight: FontWeight.bold,
            fontSize: 25),
      ),
      widget: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              CarouselSlider(
                  carouselController: carouselController,
                  items: [
                    CarouselDriver(widthMQ: widthMQ),
                    CarouselDriver(widthMQ: widthMQ),
                    CarouselDriver(widthMQ: widthMQ),
                  ],
                  options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _carouselIndex = index;
                        });
                      })),
              AnimatedSmoothIndicator(activeIndex: _carouselIndex, count: 3)
            ],
          ),
        ),
      ),
    ));
  }
}

class CarouselDriver extends StatelessWidget {
  const CarouselDriver({
    super.key,
    required this.widthMQ,
  });

  final double widthMQ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: widthMQ,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppConst.whiteColor),
          child: const Image(image: ExactAssetImage(ImagesPath.banner))),
    );
  }
}
