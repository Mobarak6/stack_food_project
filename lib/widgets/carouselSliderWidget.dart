import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  var _currentIndex = 1;
  Widget getContanier(double size, Color color) {
    return Container(
        width: size,
        height: size,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(shape: BoxShape.circle, color: color));
  }

  @override
  Widget build(BuildContext context) {
    List<String> _imagePath = [
      'lib/assets/sliderAssets/slide_1.png',
      'lib/assets/sliderAssets/slide_2.png',
      'lib/assets/sliderAssets/slide_3.png',
    ];
    return Container(
      // margin: EdgeInsets.only(top: 27),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                initialPage: 1,
                height: 80,
                onPageChanged: (index, _) {
                  setState(() {
                    _currentIndex = index;
                  });
                }),
            items: _imagePath
                .map((e) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [Image.asset(e, fit: BoxFit.cover)],
                      ),
                    ))
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _imagePath.map((e) {
              int index = _imagePath.indexOf(e);
              return _currentIndex == index
                  ? getContanier(5.0, Color.fromRGBO(239, 120, 34, 1))
                  : getContanier(3.0, Color.fromRGBO(239, 120, 34, 0.37));
            }).toList(),
          )
        ],
      ),
    );
  }
}
