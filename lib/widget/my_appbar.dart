import 'package:flutter/material.dart';
import 'package:test_lab/utils/constants.dart';
import 'package:test_lab/utils/pages.dart';
import 'package:test_lab/widget/menu_act_but.dart';

Widget myAppBar(BuildContext context) {
  var deviceSize = MediaQuery.of(context).size;

  return PreferredSize(
    preferredSize: deviceSize,
    child: Container(
      color: kTextColor,
      child: Column(
        children: [
          Row(
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
              appbarContacts(
                context,
                contactInformation['kPhoneNumber'] ?? '',
                Icons.phone,
                kPrimaryColore,
                kBackgroundColor,
              ),
              appbarContacts(
                context,
                contactInformation['kEmail'] ?? '',
                Icons.mail,
                kPrimaryColore,
                kBackgroundColor,
              ),
              appbarContacts(
                context,
                contactInformation['kShedule'] ?? '',
                Icons.watch_later_outlined,
                kPrimaryColore,
                kBackgroundColor,
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: 118,
            width: deviceSize.width,
            color: kPrimaryColore,
            child: Wrap(
              alignment: WrapAlignment.center,
              children: actionButtomList(context),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget appbarContacts(
  BuildContext context,
  String text,
  IconData icon,
  Color textColor,
  Color backColor,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        icon,
        color: textColor,
      ),
      const SizedBox(
        width: 16,
      ),
      Text(
        text,
        softWrap: false,
        maxLines: 2,
        style: TextStyle(
          color: textColor,
        ),
      ),
    ],
  );
}
