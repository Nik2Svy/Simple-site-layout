import 'package:flutter/material.dart';
import 'package:test_lab/utils/constants.dart';

Widget equipmentCard(BuildContext context, int index) {
  return Container(
    // height: 317,
    // width: 317,
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      border: Border.all(
        color: kButtonColor,
        width: 2.0,
      ),
    ),
    child: MaterialButton(
      onPressed: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Image.network(
              urlImagesEquipment[index].elementAt(0),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            urlImagesEquipment[index].elementAt(1),
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: Colors.black,
                ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    ),
  );
}
