import 'package:flutter/material.dart';
import 'package:test_lab/utils/constants.dart';
import 'package:test_lab/utils/pages.dart';

actionButtomList(BuildContext context) {
  List<Widget> actionButtomList = [];
  for (var i = 0; i < actionButtomNames.length; i++) {
    actionButtomList.add(
      actionsButtom(
        context,
        actionButtomNames[i],
        menuActButtomPages[i],
      ),
    );
  }
  return actionButtomList;
}

Widget actionsButtom(
  BuildContext context,
  String name,
  String rote,
  //String onTap,
  //Добавить, когда будут переходы на другие страницы
) {
  return Expanded(
    child: MaterialButton(
      onPressed: () {
        //onTap
        Navigator.popAndPushNamed(
          context,
          rote,
        );
      },
      child: Text(
        name,
        style: const TextStyle(
          color: kTextColor,
        ),
      ),
    ),
  );
}
