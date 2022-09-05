import 'package:flutter/material.dart';
import 'package:test_lab/utils/constants.dart';
import 'package:test_lab/utils/pages.dart';

listOfListTile(BuildContext context) {
  List<Widget> listOfListTile = [];
  // костыль, чтобы объеденить два листа и запихнуть их в children
  List<Widget> drawer = [
    DrawerHeader(
      decoration: const BoxDecoration(
        color: kPrimaryColore,
      ),
      child: Column(
        children: [
          IconButton(
            icon: Image.asset(
              kMainLogo,
            ),
            iconSize: 86,
            onPressed: () {},
          ),
          const Text(
            kMainName,
            style: TextStyle(
              color: kTextColor,
            ),
          ),
        ],
      ),
    ),
  ];
  for (var i = 0; i < actionButtomNames.length; i++) {
    listOfListTile.add(
      ListTile(
        title: Text(
          actionButtomNames[i],
        ),
        onTap: () {
          Navigator.popAndPushNamed(
            context,
            aboutCompanyPage,
          );
        },
      ),
    );
  }
  return drawer + listOfListTile;
}
