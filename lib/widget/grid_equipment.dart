import 'package:flutter/material.dart';
import 'package:test_lab/utils/constants.dart';
import 'package:test_lab/widget/grid_equipment_card.dart';
import 'package:test_lab/widget/on_hover_eq_card.dart';
import 'package:test_lab/widget/responsive.dart';

gridEquipment(BuildContext context, Size size) {
  return SizedBox(
    height: (() {
      if (ResponsiveWidget.isLargeScreen(context) ||
          ResponsiveWidget.isMediumScreen(context)) {
        return size.height * 1.15;
        // костыль, при том нормально не работающий
      } else if (ResponsiveWidget.isSmallScreen(context) && size.width > 527) {
        return size.height * 1.7;
      } else {
        return size.height * 1.2;
      }
    }()),
    width: 950,
    child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          sectionNames[0],
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (() {
                if (ResponsiveWidget.isLargeScreen(context) ||
                    ResponsiveWidget.isMediumScreen(context)) {
                  return 3;
                } else {
                  return 2;
                }
              }()),
            ),
            children: createListOfEqCards(context),
            // physics: RangeMaintainingScrollPhysics(),
          ),
        ),
      ],
    ),
  );
}

createListOfEqCards(BuildContext context) {
  List<Widget> listOfEqCards = [];
  for (var i = 0; i < urlImagesEquipment.length; i++) {
    listOfEqCards.add(OnHoverCard(
      child: equipmentCard(context, i),
    ));
  }
  return listOfEqCards;
}















// final urlImagesEquipment = [
//   {'https://picsum.photos/300/300', 'Анализаторы металлов'},
//   {'https://picsum.photos/300/300', 'Толщиномеры покрытий '},
//   {'https://picsum.photos/300/300', 'Анализаторы металлов'},
//   {'https://picsum.photos/300/300', 'Толщиномеры покрытий '},
//   {'https://picsum.photos/300/300', 'Анализаторы металлов'},
//   {'https://picsum.photos/300/300', 'Толщиномеры покрытий '},
//   {'https://picsum.photos/300/300', 'Анализаторы металлов'},
//   {'https://picsum.photos/300/300', 'Толщиномеры покрытий '},
// ];

// gridEquipment(BuildContext context, Size size) {
//   return SizedBox(
//     height: size.height,
//     width: size.width / 2,
//     child: GridView.builder(
//       itemCount: urlImagesEquipment.length,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//       ),
//       itemBuilder: (context, index) {
//         return equipmentCard(context, index);
//       },
//       //physics: NeverScrollableScrollPhysics(),
//     ),
//   );
// }

// equipmentCard(BuildContext context, int index) {
//   final hoveredTransform = Matrix4.identity()..scale(1.1);
//   final trasform = hoveredTransform;
//   return Container(
//     margin: const EdgeInsets.all(10),
//     decoration: BoxDecoration(
//       border: Border.all(
//         color: kButtonColor,
//         width: 2.0,
//       ),
//     ),
//     child: AnimatedContainer(
//       duration: Duration(milliseconds: 200),
//       transform: trasform,
//       child: MouseRegion(
//         onEnter: (event) => onEntered(true),
//         onExit: (event) => onEntered(false),
//         child: MaterialButton(
//           onPressed: () {},
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               Image.network(
//                 urlImagesEquipment[index].elementAt(0),
//                 fit: BoxFit.cover,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 urlImagesEquipment[index].elementAt(1),
//                 style: Theme.of(context).textTheme.subtitle1,
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
