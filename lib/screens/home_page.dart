import 'package:flutter/material.dart';
import 'package:test_lab/utils/constants.dart';
import 'package:test_lab/widget/drawer_list.dart';

import 'package:test_lab/widget/my_appbar.dart';
import 'package:test_lab/widget/card_swiper.dart';
import 'package:test_lab/widget/grid_equipment.dart';
import 'package:test_lab/widget/my_footer.dart';

import 'package:test_lab/widget/responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: (() {
        if (ResponsiveWidget.isSmallScreen(context)) {
          return AppBar(
            backgroundColor: kPrimaryColore,
            title: const Text(kMainName),
          );
        } else {
          return null;
        }
      }()),
      drawer: (() {
        if (ResponsiveWidget.isSmallScreen(context)) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: listOfListTile(context),
            ),
          );
        } else {
          return null;
        }
      }()),
      body: SizedBox(
        height: deviceSize.height,
        width: deviceSize.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              (() {
                if (!ResponsiveWidget.isSmallScreen(context)) {
                  return myAppBar(context);
                } else {
                  return const SizedBox();
                }
              }()),
              const MyCardSwiper(),
              gridEquipment(context, deviceSize),
              myFooter(
                context,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
