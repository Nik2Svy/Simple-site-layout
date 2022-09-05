import 'package:flutter/material.dart';
import 'package:test_lab/utils/constants.dart';
import 'package:test_lab/widget/responsive.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyCardSwiper extends StatefulWidget {
  const MyCardSwiper({Key? key}) : super(key: key);

  @override
  MyCardSwiperState createState() => MyCardSwiperState();
}

class MyCardSwiperState extends State<MyCardSwiper> {
  final controller = CarouselController();
  int activeIndex = 0;
  int slidersCount = urlImages.length;
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    return SizedBox(
      child: largeScreen(
        deviceSize,
      ),
    );
  }

// название «largeScreen» было выбрано т.к. планировалось реализовать еще для маленьких экранов
  Widget largeScreen(
    Size deviceSize,
  ) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          itemCount: slidersCount,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            final urlImage = urlImages[itemIndex];
            return returnSlide(context, urlImage, itemIndex);
          },
          options: CarouselOptions(
              height: 480,
              aspectRatio: 4,
              viewportFraction: 1,
              autoPlay: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              onPageChanged: ((index, reason) {
                setState(() {
                  activeIndex = index;
                });
              })),
        ),
        buildIndicator(activeIndex, slidersCount),
      ],
    );
  }

  Widget returnSlide(
    BuildContext context,
    String imageName,
    int itemIndex,
  ) {
    var deviceSize = MediaQuery.of(context).size;
    return SizedBox(
      height: deviceSize.width / 4,
      width: deviceSize.width,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageName),
            fit: BoxFit.cover,
          ),
        ),
        child: textOnCardSwiper(deviceSize, itemIndex),
      ),
    );
  }

  Widget textOnCardSwiper(
    Size deviceSize,
    int itemIndex,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: (() {
        if (ResponsiveWidget.isLargeScreen(context) ||
            ResponsiveWidget.isMediumScreen(context)) {
          return deviceSize.width / 5;
        } else {
          return 25.0;
        }
      }())),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textSlide[itemIndex].elementAt(0),
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            textSlide[itemIndex].elementAt(1),
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(
            height: 20,
          ),
          myButtonOnCard(itemIndex),
        ],
      ),
    );
  }

  Widget myButtonOnCard(
    int itemIndex,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: kButtonColor,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: MaterialButton(
        visualDensity: const VisualDensity(horizontal: 2, vertical: 2),
        onPressed: () {},
        child: Text(
          textSlide[itemIndex].elementAt(2),
          style: const TextStyle(
            color: kTextColor,
          ),
        ),
      ),
    );
  }

  Widget buildIndicator(
    int activeIndex,
    int slidersCount,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedSmoothIndicator(
          onDotClicked: animateToSlide,
          activeIndex: activeIndex,
          count: slidersCount,
          effect: const WormEffect(
            radius: 17,
            dotColor: kTextColor,
            activeDotColor: kPrimaryColore,
          ),
        ),
      ),
    );
  }

  animateToSlide(int index) => controller.animateToPage(index);
}
