import 'package:flutter/material.dart';
import 'package:test_lab/utils/constants.dart';
import 'package:test_lab/widget/drawer_list.dart';
import 'package:test_lab/widget/grid_equipment_card.dart';
import 'package:test_lab/widget/my_appbar.dart';
import 'package:test_lab/widget/my_dropdown_button.dart';
import 'package:test_lab/widget/my_footer.dart';
import 'package:test_lab/widget/on_hover_eq_card.dart';
import 'package:test_lab/widget/responsive.dart';

class CatalogPage extends StatelessWidget {
  CatalogPage({Key? key}) : super(key: key);

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
              bodyCatalog(context),
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

bodyCatalog(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
        width: kContetnWidth,
        height: kContentHeight,
        //_getSize(CatalogPage()._key)?.height ?? 1000,
        child: Row(
          children: [
            (() {
              if (ResponsiveWidget.isLargeScreen(context) ||
                  ResponsiveWidget.isMediumScreen(context)) {
                return Flexible(
                  child: MyDropdownButton(),
                );
              } else {
                return const SizedBox();
              }
            }()),
            Flexible(
              child: gridEquipment_01(),
              flex: 4,
            ),
          ],
        )),
  );
}

gridEquipment_01() {
  return GridView.custom(
    // shrinkWrap: true,
    childrenDelegate: SliverChildBuilderDelegate(
      (context, index) => OnHoverCard(
        child: equipmentCard(context, index),
      ),
      childCount: urlImagesEquipment.length,
    ),
    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 360,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
    ),
  );
}
