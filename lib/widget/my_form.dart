import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_lab/utils/constants.dart';

// Создает кастомный блок для обратной связи
class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  bool _checkboxValue = false;
  final _checkboxFormKey = GlobalKey<FormState>();
  final _1stRowFormKey = GlobalKey<FormState>();
  // final _2ndRowFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shortcuts(
        shortcuts: const <ShortcutActivator, Intent>{
          // При нажатии на пробел переходит к следующему полю
          // Что значит «:»?
          SingleActivator(LogicalKeyboardKey.nextCandidate): NextFocusIntent(),
        },
        child: FocusTraversalGroup(
          child: Form(
            key: _checkboxFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: () {
              Form.of(primaryFocus!.context!)!.save();
            },
            child: Container(
              color: kPrimaryColore,
              //height: 400,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        columnForm(
                          [
                            buildTextFormField('ФИО', true),
                            buildTextFormField('E-mail', true),
                            buildNumber(),
                          ],
                          _1stRowFormKey,
                        ),
                        columnForm(
                          [
                            buildTextFormField('Наименование изделия'),
                            buildTextFormField('Серийный номер'),
                            buildTextFormField('Коментарий'),
                          ],
                          // _2ndRowFormKey,
                        ),
                      ],
                    ),
                    checkboxListTileForm(),
                    OutlinedButton(
                      onPressed: () {
                        checkFields();
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: kBackgroundColor,

                        // foregroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.all(16.0),
                      ),
                      child: const Text(
                        'Отправить',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

// Возвращает Column с Form виджетами
  columnForm(List<Widget> childrenTextForm, [GlobalKey? key]) {
    return Flexible(
      child: FocusTraversalGroup(
        child: Form(
          key: key,
          onChanged: () {
            Form.of(primaryFocus!.context!)!.save();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: childrenTextForm,
            ),
          ),
        ),
      ),
    );
  }

// Возвращает декорированный Form виджет, принимающий все символы
  buildTextFormField(String labelText, [bool required = false]) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints.tight(
            const Size(300, 100)), // устанавливает размелы поля ввода
        child: TextFormField(
          textInputAction: TextInputAction.next,

          decoration: InputDecoration(
            // constraints: BoxConstraints(maxHeight: 50, maxWidth: 200),
            helperText: 'Обязательное поле',
            helperStyle: required
                ? const TextStyle(
                    color: kBackgroundColor,
                  )
                : null,
            labelText: labelText,
            fillColor: kBackgroundColor,

            labelStyle: const TextStyle(
              color: kBackgroundColor,
            ),
            border: const OutlineInputBorder(),
            // цвет границы
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: kBackgroundColor)),
            // цвет границы, когда происходит ввод
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: kBackgroundColor)),
          ),

          validator: (value) {
            return emptyValidator(value);
          },
          // проверяет заполненность поля и вызвает вызывает «validator»
          // autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ),
    );
  }

// Возвращает декорированный Form виджет, принимающий только цифры
  buildNumber() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints.tight(const Size(300, 100)),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          inputFormatters: [
            LengthLimitingTextInputFormatter(10),
            // указывает какие символы разрешены для ввода
            FilteringTextInputFormatter.allow(RegExp('[0-9]'))
          ],
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            helperText: 'Обязательное поле',
            helperStyle: TextStyle(
              color: kBackgroundColor,
            ),
            prefixText: '+7',
            prefixStyle: TextStyle(
              color: kBackgroundColor,
            ),
            labelText: 'Ваш номер телефона',
            fillColor: kBackgroundColor,
            labelStyle: TextStyle(
              color: kBackgroundColor,
            ),
            border: OutlineInputBorder(),
            // цвет границы
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: kBackgroundColor)),
            // цвет границы, когда происходит ввод
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: kBackgroundColor)),
          ),
          validator: (value) {
            return emptyValidator(value);
          },
        ),
      ),
    );
  }

// Возвращает Checkbox виджет
  checkboxListTileForm() {
    return FormField(
      validator: (value) {
        if (_checkboxValue == false) {
          return 'Заполните, пожалуйста, поле';
        }
        return null;
      },
      builder: ((field) {
        return CheckboxListTile(
          dense: field.hasError,
          value: _checkboxValue,
          onChanged: (value) {
            onCheckboxValueChanged(value);
          },
          side: const BorderSide(
            color: kBackgroundColor,
          ),
          activeColor: kBackgroundColor,
          checkColor: Colors.black,
          title: const Text('Я согласен(а) на обработку персональных данных'),
          controlAffinity: ListTileControlAffinity.leading,
          subtitle: field.hasError
              ? Builder(
                  builder: (BuildContext context) => Text(
                    field.errorText.toString(),
                    style: TextStyle(color: Theme.of(context).errorColor),
                  ),
                )
              : null,
        );
      }),
    );
  }

// Проверят заполнены ли формы
  checkFields() {
    _checkboxFormKey.currentState!.validate();
    _1stRowFormKey.currentState!.validate();
  }

// Как сделать что-бы обновлялся только Checkbox, а не весь виджет целеком?
  onCheckboxValueChanged(bool? value) {
    setState(() {
      _checkboxValue = value!;
    });
  }

  emptyValidator(String? value) {
    if (value!.isEmpty) {
      return 'Заполните, пожалуйста, поле';
    }
    return null;
  }
}
