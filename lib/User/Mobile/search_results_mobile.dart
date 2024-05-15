import 'package:demoproject/Constants/const_widget.dart';
import 'package:demoproject/Constants/dimensions.dart';
import 'package:demoproject/Constants/images.dart';
import 'package:demoproject/User/Mobile/background.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class UserSearchResultsMobile extends StatefulWidget {
  const UserSearchResultsMobile({super.key});

  @override
  State<UserSearchResultsMobile> createState() =>
      _UserSearchResultsMobileState();
}

class _UserSearchResultsMobileState extends State<UserSearchResultsMobile> {
  @override
  Widget build(BuildContext context) {
    return UserBackground(
        title: const Text(
          'Select My Artist',
          style: TextStyle(
              fontFamily: AppConst.fontMontserrat,
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
        widget: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  fillColor: AppConst.whiteColor,
                  filled: true,
                  prefixIcon: const Icon(
                    Icons.search,
                  ),
                  hintText: 'Search parameters',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FilterButton(),
                    FilterButton(),
                    FilterButton(),
                    FilterButton(),
                    FilterButton(),
                    FilterButton(),
                    FilterButton(),
                    FilterButton(),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              // ArtistCard()
              Expanded(
                child: GridView.count(
                          childAspectRatio: 1,
                  crossAxisCount: 2,

                  children: [
                    const ArtistCard(),
                    const ArtistCard(),
                    const ArtistCard(),
                    const ArtistCard(),
                    const ArtistCard(),
                    const ArtistCard(),
                    const ArtistCard(),
                    const ArtistCard(),
                    const ArtistCard(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class ArtistCard extends StatelessWidget {
  const ArtistCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppConst.whiteColor)),
      child: Column(
        children: <Widget>[
          Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.antiAlias,
              color: AppConst.whiteColor,
              shadowColor: Colors.transparent,
              elevation: 5.0,
              child: Image.asset(
                ImagesPath.banner,
                height: 100,
                width: 200,
              )),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'data',
                  style: TextStyle(color: AppConst.whiteColor),
                ),
                Text('data', style: TextStyle(color: AppConst.whiteColor))
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'data',
                  style: TextStyle(color: AppConst.whiteColor),
                ),
                Text('data', style: TextStyle(color: AppConst.whiteColor))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      width: 80,
      decoration: BoxDecoration(
          color: AppConst.whiteColor, borderRadius: BorderRadius.circular(10)),
      child: const Text('Filter'),
    );
  }
}
