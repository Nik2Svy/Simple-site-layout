import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:test_lab/utils/constants.dart';
import 'package:test_lab/widget/drawer_list.dart';
import 'package:test_lab/widget/my_appbar.dart';
import 'package:test_lab/widget/my_footer.dart';
import 'package:test_lab/widget/responsive.dart';
import 'package:flutter_svg/flutter_svg.dart';

const String aboutCompany =
    'Значимость этих проблем настолько очевидна, что граница обучения кадров, в своём классическом представлении, допускает внедрение соответствующих условий активизации. Как принято считать, диаграммы связей являются только методом политического участия и ассоциативно распределены по отраслям. Сложно сказать, почему диаграммы связей, инициированные исключительно синтетически, ограничены исключительно образом мышления. Вот вам яркий пример современных тенденций — постоянное информационно-пропагандистское обеспечение нашей деятельности влечет за собой процесс внедрения и модернизации анализа существующих паттернов поведения. В своём стремлении улучшить пользовательский опыт мы упускаем, что диаграммы связей набирают популярность среди определенных слоев населения, а значит, должны быть объединены в целые кластеры себе подобных. В рамках спецификации современных стандартов, диаграммы связей представляют собой не что иное, как квинтэссенцию победы маркетинга над разумом и должны быть призваны к ответу.';

const mapShortInfoWithPictures = [
  {
    'assets/icons/success.svg',
    'Первое место по продажам оборудования для химического анализа в РФ',
  },
  {
    'assets/icons/excellence.svg',
    'Первое место по продажам оборудования для химического анализа в РФ',
  },
  {
    'assets/icons/success.svg',
    'Первое место по продажам оборудования для химического анализа в РФ',
  },
  {
    'assets/icons/excellence.svg',
    'Первое место по продажам оборудования для химического анализа в РФ',
  },
];

ValueNotifier<bool> isHovered = ValueNotifier(false);

class AboutCompanyPage extends StatelessWidget {
  const AboutCompanyPage({Key? key}) : super(key: key);

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
        child: ValueListenableBuilder<bool>(
          valueListenable: isHovered,
          builder: (
            context,
            value,
            child,
          ) =>
              SingleChildScrollView(
            physics: value ? const NeverScrollableScrollPhysics() : null,
            controller: ScrollController(),
            child: Column(
              children: <Widget>[
                (() {
                  if (!ResponsiveWidget.isSmallScreen(context)) {
                    return myAppBar(context);
                  } else {
                    return const SizedBox();
                  }
                }()),
                bodyAboutCompany(context),
                myFooter(
                  context,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Надо научится избавляться от «BuildContext context» в функциях, а то какой смысл их писать отдельно
// к тому же BuildContext всегда свой
bodyAboutCompany(BuildContext context) {
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
              actionButtomNames[1],
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
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: shortInfoWithPictures(context),
          ),
          contactsWithMap(context),
        ],
      ),
    ),
  );
}

shortInfoWithPictures(
  BuildContext context,
) {
  // IntrinsicHeight «говрит» VerticalDivider кокой высоты он должн быть
  // Из документации: Виджет, размер дочернего элемента которого соответствует внутренней высоте дочернего элемента.
  // -//-: Этот класс относительно дорог, потому что он добавляет спекулятивный проход макета перед финальной фазой макета.
  return IntrinsicHeight(
    child: Row(
      children: (() {
        List<Widget> shortInfo = [];
        for (var i = 0; i < mapShortInfoWithPictures.length; i++) {
          shortInfo.add(infoWithPicture(context, i));
          shortInfo.add(
            const VerticalDivider(
              width: 15,
              color: kPrimaryColore,
            ),
          );
        }
        // удаляет последний элемент. При этом возвращает его
        shortInfo.removeLast();
        return shortInfo;
      }()),
    ),
  );
}

// применение svg картинок(для практкики)
infoWithPicture(
  BuildContext context,
  int i,
) {
  return Flexible(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: SvgPicture.asset(
            mapShortInfoWithPictures[i].elementAt(0),
            height: 80,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          child: Text(
            mapShortInfoWithPictures[i].elementAt(1),
            style: Theme.of(context).textTheme.caption,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}

// Думаю, что дублирование информции на карте и в futter не самая лучшая идея, но мало ли после карты будет ещё какая-то инфа
contactsWithMap(BuildContext context) {
  return Container(
    height: 350,
    width: 950,
    color: kPrimaryColore,
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sectionNames[2],
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: kFooterColor,
                    ),
              ),
              appbarContacts(
                context,
                contactInformation['kPhoneNumber'] ?? '',
                Icons.phone,
                kFooterColor,
                kPrimaryColore,
              ),
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
              appbarContacts(
                context,
                contactInformation['kShedule'] ?? '',
                Icons.watch_later_outlined,
                kFooterColor,
                kPrimaryColore,
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: map(),
          ),
        ),
      ],
    ),
  );
}

// добавление карты
map() {
  return MouseRegion(
    onEnter: (v) {
      isHovered.value = true;
    },
    onExit: (v) {
      isHovered.value = false;
    },
    child: FlutterMap(
      options: MapOptions(
        center: LatLng(51.509364, -0.128928),
        zoom: 15.2,
        keepAlive: true,
        maxZoom: 18,
      ),
      // указывается название ислозьзуемого сервера тайлов (TOS)
      nonRotatedChildren: [
        AttributionWidget.defaultWidget(
          source: 'OpenStreetMap contributors',
          onSourceTapped: null,
        ),
        Container(
          width: 10,
          height: 10,
          color: Colors.amber,
        ),
      ],
      children: [
        TileLayerWidget(
          options: TileLayerOptions(
            // шаблон для создания плиток (tile server)
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            userAgentPackageName: 'com.example.app',
          ),
        ),
        MarkerLayerWidget(
          options: MarkerLayerOptions(
            markers: [
              Marker(
                point: LatLng(51.509364, -0.128928),
                width: 30,
                height: 30,
                builder: (context) => const FlutterLogo(),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
