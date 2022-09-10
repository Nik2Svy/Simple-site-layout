import 'package:flutter/material.dart';
import 'package:test_lab/utils/constants.dart';
import 'package:test_lab/utils/pages.dart';
import 'package:test_lab/widget/my_appbar.dart';
import 'package:test_lab/widget/menu_act_but.dart';
import 'package:test_lab/widget/responsive.dart';

myFooter(BuildContext context) {
  var deviceSize = MediaQuery.of(context).size;
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: 10,
    ),
    alignment: Alignment.center,
    height: 200,
    width: deviceSize.width,
    color: kPrimaryColore,
    child: SizedBox(
      height: 200,
      width: 950,
      child: (() {
        if (ResponsiveWidget.isLargeScreen(context) ||
            ResponsiveWidget.isMediumScreen(context)) {
          return largeFooter(context);
        } else {
          return smallFooter(context);
        }
      }()),
    ),
  );
}

largeFooter(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
        icon: Image.asset(
          kMainLogo,
        ),
        iconSize: 86,
        onPressed: () {
          Navigator.popAndPushNamed(
            context,
            homePage,
          );
        },
      ),
      const VerticalDivider(
        color: kBackgroundColor,
      ),
      Expanded(
        child: Wrap(
          alignment: WrapAlignment.center,
          children: actionButtomList(context),
          // physics: NeverScrollableScrollPhysics(),
        ),
      ),
      const VerticalDivider(
        color: kBackgroundColor,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appbarContacts(
              context,
              contactInformation['kPhoneNumber'] ?? '',
              Icons.phone,
              kFooterColor,
              kPrimaryColore,
            ),
            const SizedBox(
              height: 16,
            ),
            appbarContacts(
              context,
              contactInformation['kEmail'] ?? '',
              Icons.mail,
              kFooterColor,
              kPrimaryColore,
            ),
          ],
        ),
      ),
      const VerticalDivider(
        color: kBackgroundColor,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: appbarContacts(
          context,
          contactInformation['kAddress'] ?? '',
          Icons.map_outlined,
          kFooterColor,
          kPrimaryColore,
        ),
      )
    ],
  );
}

Widget smallFooter(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      IconButton(
        icon: Image.asset(
          kMainLogo,
        ),
        iconSize: 86,
        onPressed: () {
          Navigator.popAndPushNamed(
            context,
            homePage,
          );
        },
      ),
      const VerticalDivider(
        color: kBackgroundColor,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            appbarContacts(context, contactInformation['kPhoneNumber'] ?? '',
                Icons.phone, kFooterColor, kPrimaryColore),
            appbarContacts(
              context,
              contactInformation['kEmail'] ?? '',
              Icons.mail,
              kFooterColor,
              kPrimaryColore,
            ),
            appbarContacts(
              context,
              contactInformation['kAddress'] ?? '',
              Icons.map_outlined,
              kFooterColor,
              kPrimaryColore,
            ),
          ],
        ),
      ),
    ],
  );
}
