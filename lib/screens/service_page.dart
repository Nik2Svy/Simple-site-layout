import 'package:flutter/material.dart';
import 'package:test_lab/screens/about_company.dart';
import 'package:test_lab/utils/constants.dart';
import 'package:test_lab/widget/drawer_list.dart';
import 'package:test_lab/widget/my_appbar.dart';
import 'package:test_lab/widget/my_footer.dart';
import 'package:test_lab/widget/my_form.dart';
import 'package:test_lab/widget/responsive.dart';

class ServicePage extends StatelessWidget {
  ServicePage({Key? key}) : super(key: key);

  //var _key = GlobalKey();

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
              bodyServicePage(context),
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

bodyServicePage(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      width: kContetnWidth,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: Text(
              actionButtomNames[3],
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: RichText(
                text: TextSpan(
              text: aboutCompany,
              style: Theme.of(context).textTheme.bodyText1,
            )),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: MyForm(),
          ),
        ],
      ),
    ),
  );
}
