import 'package:flutter/material.dart';
import 'package:test_lab/utils/constants.dart';
import 'package:test_lab/widget/drawer_list.dart';
import 'package:test_lab/widget/my_appbar.dart';
import 'package:test_lab/widget/my_footer.dart';
import 'package:test_lab/widget/responsive.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

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
              bodyCatalog(),
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

bodyCatalog() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
        width: kContetnWidth,
        // height: 1080,
        child: Row(
          children: [
            Flexible(
              child: sideCatalog(),
            ),
            Flexible(
              child: gridEquipment_01(),
            )
          ],
        )),
  );
}

sideCatalog() {
  return SizedBox(
    height: 300,
    child: ListView.builder(
        itemCount: urlImagesEquipment.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: kPrimaryColore,
                padding: const EdgeInsets.all(16.0),
                // textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: Text(
                urlImagesEquipment[index].elementAt(1),
              ),
            ),
          );
        }),
  );
}

gridEquipment_01() {}

mainCatalogCards() {}
