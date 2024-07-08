import 'package:demoproject/Constants/custom_widgets.dart';
import 'package:demoproject/Constants/dimensions.dart';
import 'package:demoproject/Constants/font_colors.dart';
import 'package:demoproject/Constants/images.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class HealthOverview extends StatefulWidget {
  const HealthOverview({super.key});

  @override
  State<HealthOverview> createState() => _HealthOverviewState();
}

class _HealthOverviewState extends State<HealthOverview> {
  int _selectedIndex = 0;
  final List<String> _items = ['Today', 'yesterday'];
  final String name = 'Jillian Hanson';
  final String steps = '8k';
  final String goal = '10,000';
  final String waterIntake = '2.1';
  final String calories = '2.1';
  final String pulse = '1.2k';
  final String weight = '64';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: TSizes.widthMQ * 0.04,
              vertical: TSizes.widthMQ * 0.1),
          child: Column(
            children: [
              _header(ImagesPath.artistAvatar, name),
              _headerText('Health Overview', '2'),

              const Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                      text: 'Your Daily Health Statistics',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: AppConst.greyColor)),const SizedBox(height: 20),
              Row(
                children: [
                  _stepCounter(steps, goal),
                  const SizedBox(width: 20),
                  _statistics()
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      child: customCard('Water', waterIntake, 'Liters',
                          ImagesPath.drop, MediaQuery.of(context).size.width)),
                  const SizedBox(width: 20),
                  Expanded(
                      child: customCard('Calories', calories, 'Kcal',
                          ImagesPath.pizza, MediaQuery.of(context).size.width)),
                ],
              ),
              SizedBox(height: 20),

              _pulseWeight('78', '64')
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 50, left: 12.0),
        child: SizedBox(
          height: 60,
          width: 60,
          child: FittedBox(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 6.0,
                ),
              ),
              child: FloatingActionButton(
                shape: const CircleBorder(),
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: BottomAppBar(
            color: const Color(0xFF161616),
            notchMargin: 8,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildNavItem(
                    icon: const Icon(FluentIcons.grid_16_regular,
                        color: Colors.white),
                    index: 0,
                  ),
                  _buildNavItem(
                    icon: const Icon(FluentIcons.data_pie_16_regular,
                        color: Colors.white),
                    index: 1,
                  ),
                  const SizedBox(width: 48),
                  _buildNavItem(
                    icon: const Icon(FluentIcons.book_open_28_regular,
                        color: Colors.white),
                    index: 2,
                  ),
                  _buildNavItem(
                    icon: const ImageIcon(
                      AssetImage('assets/images/filter.png'),
                      color: Colors.white,
                    ),
                    index: 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerText(String text, String num) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomText(
            text: text,
            fontSize: TSizes.widthMQ * 0.09,
            fontWeight: FontWeight.normal,
            color: Colors.black),
        Container(
            margin: const EdgeInsets.only(top: 10, left: 5),
            width: 25,
            height: 25,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF838383), width: 2),
            ),
            child: Text(
              num,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color(0xFF838383),
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            )),
      ],
    );
  }

  Widget _header(String imagePath, String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 32,
          child: Image.asset(imagePath),
        ),
        const SizedBox(width: 8),
        CustomText(
          text: name,
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        const Spacer(),
        Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black),
            ),
            child: const Icon(Icons.menu)),
      ],
    );
  }

  Widget iconContainer(
      IconData icon, Color backgroundColor, Color iconColor, double size) {
    return Container(
        width: size,
        height: size,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
        child: Icon(icon, color: iconColor));
  }

  Widget customCard(String text1, String numberText, String unitText,
      String iconPath, double width) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.07),
          border: Border.all(
            width: 1,
            color: Colors.grey.withOpacity(0.5),
          )),
      // elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(width * .05),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    text1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "OpenSans",
                      fontSize: width * 0.048,
                    ),
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    iconPath,
                    height: width * 0.05,
                    width: width * .05,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  numberText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "OpenSans",
                    fontSize: width * 0.09,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: Text(
                    textAlign: TextAlign.center,
                    unitText,
                    style: const TextStyle(
                      fontFamily: "OpenSans",
                      color: AppConst.purpleColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({required Widget icon, required int index}) {
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          icon,
          const SizedBox(height: 2),
          Container(
            alignment: Alignment.center,
            height: 2,
            width: 25,
            color: _selectedIndex == index ? Colors.white : Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget _stepCounter(String step, String goal) {
    return Expanded(
        child: Container(
      height: 200,
      width: TSizes.widthMQ,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey.withOpacity(0.5))),
      child: Column(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: PieChart(
              PieChartData(
                  sections: [
                    PieChartSectionData(
                      color: AppConst.darkPurpleColor,
                      value: 30,
                      radius: 40,
                      // Larger radius for the 25% slice
                      showTitle: false,
                    ),
                    PieChartSectionData(
                      color: AppConst.purpleColor,
                      value: 70,
                      radius: 40,
                      showTitle: false,
                    ),
                  ],
                  startDegreeOffset: -90,
                  sectionsSpace: 4,
                  centerSpaceRadius: 0 // Gap between sections
                  ),
            ),
          ),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    step,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "OpenSans",
                      fontSize: TSizes.widthMQ * 0.09,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 7),
                    child: Text(
                      textAlign: TextAlign.center,
                      goal,
                      style: const TextStyle(
                        fontFamily: "OpenSans",
                        color: Color(0xFF44746a),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const CustomText(
                  text: 'Out of 10000',
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF44746a))
            ],
          ),
        ],
      ),
    ));
  }

  Widget _statistics() {
    return Expanded(
        child: SizedBox(
      height: 200,
      width: TSizes.widthMQ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropDownField(
            onChanged: (String? value) {},
            items: _items
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            title: 'Today',
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      iconContainer(Icons.file_download_outlined,
                          const Color(0xFFdcd2f7), const Color(0xFF8577ab), 55),
                      iconContainer(Icons.library_books,
                          const Color(0xFFdcd2f7), const Color(0xFF8577ab), 55),
                    ]),
                const SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      iconContainer(Icons.edit, const Color(0xFFdcd2f7),
                          const Color(0xFF8577ab), 55),
                      iconContainer(FluentIcons.data_pie_16_filled,
                          const Color(0xFFdcd2f7), const Color(0xFF8577ab), 55),
                    ]),
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget _pulseWeight(String pulse, String weight) {
    return Container(
      height: 120,
      width: TSizes.widthMQ,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImagesPath.customShape), fit: BoxFit.fill)),
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Pulse',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "OpenSans",
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    ImagesPath.pulse,
                    width: 20,
                    height: 20,
                    color: AppConst.purpleColor,
                  ),
                  SizedBox(width: TSizes.widthMQ * 0.25),
                  const Text('Weight',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "OpenSans",
                      )),
                  const SizedBox(width: 8),
                  Image.asset(
                    ImagesPath.weight,
                    width: 20,
                    height: 20,
                    color: AppConst.purpleColor,
                  )
                ],
              ),
              Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        pulse,
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: "OpenSans",
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 5.0, left: 5),
                        child: Text(
                          'BPM',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "OpenSans",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: TSizes.widthMQ * 0.25),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        weight,
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: "OpenSans",
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 5.0, left: 5),
                        child: Text(
                          'KG',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "OpenSans",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: const Alignment(1.05, -1.5),
            child: Container(
                width: 55,
                height: 55,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child:
                    const Icon(Icons.more_horiz, color: AppConst.whiteColor)),
          ),
        ],
      ),
    );
  }
}
