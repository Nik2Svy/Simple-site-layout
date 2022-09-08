import 'package:flutter/material.dart';
import 'package:test_lab/utils/constants.dart';

class MyDropdownButton extends StatefulWidget {
  MyDropdownButton({Key? key}) : super(key: key);

  @override
  _MyDropdownButtonState createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  List<String> namesElementsOfTheMainList = List.generate(
      urlImagesEquipment.length,
      (index) => urlImagesEquipment[index].elementAt(1));

  List<ValueNotifier<bool>> isOnTapList = List.generate(
    urlImagesEquipment.length,
    (index) => ValueNotifier(false),
  );

  // Map<String, ValueNotifier<bool>> isOnTapListFunction_01 = {};

// Ключ — номер элемента, у которого должен быть выпадающий список
// Значение — имена элементов выпадающего списка List<String>
  Map<int, List<String>> whichItemsShouldBeWithAdditionalList = {
    0: [
      'название 0',
      'название 0',
      'название 0',
    ],
    1: [
      'название 1',
      'название 1',
    ],
    3: [
      'название 3',
      'название 3',
      'название 3',
    ],
    6: [
      'название 6',
      'название 6',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: isOnTapList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Column(
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: kPrimaryColore,
                    padding: const EdgeInsets.all(16.0),
                    side: const BorderSide(width: 2, color: kPrimaryColore),
                    // textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (() {
                        Widget arrowContainer = const SizedBox();
                        for (var e
                            in whichItemsShouldBeWithAdditionalList.keys) {
                          if (e == index) {
                            arrowContainer = GestureDetector(
                              onTap: () {
                                isOnTapList[index].value =
                                    !isOnTapList[index].value;

                                addItem(); // обновляет состояние большого List
                              },
                              child: Container(
                                color: Colors.grey[300],
                                child: ValueListenableBuilder<bool>(
                                  valueListenable: isOnTapList[index],
                                  builder: (
                                    context,
                                    value,
                                    child,
                                  ) =>
                                      Center(
                                    child: value
                                        ? const Icon(
                                            Icons.arrow_drop_down,
                                          )
                                        : const Icon(
                                            Icons.arrow_right,
                                          ),
                                  ),
                                ),
                              ),
                            );
                          }
                        }
                        return arrowContainer;
                      }()),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Text(
                          namesElementsOfTheMainList[index],
                          //Надо обернуть во Flexible, что-бы правильно работало свойство overflow
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                (() {
                  if (isOnTapList[index].value) {
                    return ListView.builder(
                        shrinkWrap:
                            true, // позволяет маленькому List занять только то место, которое ему необходимо
                        itemCount:
                            whichItemsShouldBeWithAdditionalList[index]?.length,
                        itemBuilder: ((context, i) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 20,
                            ),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: kPrimaryColore,
                                padding: const EdgeInsets.all(16.0),
                                side: const BorderSide(
                                    width: 2, color: kPrimaryColore),
                              ),
                              onPressed: () {},
                              child: Text(
                                whichItemsShouldBeWithAdditionalList[index]
                                        ?.elementAt(i) ??
                                    '',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        }));
                  } else {
                    return const SizedBox();
                  }
                }()),
              ],
            ),
          );
        });
  }

  void addItem() {
    setState(() {});
  }
}
