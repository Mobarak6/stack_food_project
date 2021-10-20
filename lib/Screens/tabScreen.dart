import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stack_food/Screens/cartScreen.dart';
import 'package:stack_food/Screens/favoritScreen.dart';

import 'package:stack_food/Screens/homeScreen.dart';
import 'package:stack_food/Screens/orderScreen.dart';
import 'package:stack_food/Screens/profileScreen.dart';
import 'package:stack_food/model/Colors.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  // List<Widget> widgetList() {
  //   return [
  //     InkWell(
  //       onTap: () {
  //         // Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  //       },
  //       child: SvgPicture.asset('lib/assets/icons/home.svg'),
  //     ),
  //     InkWell(
  //       onTap: () {
  //         //Navigator.of(context).pushReplacementNamed(FavoritScreen.routeName);
  //       },
  //       child: SvgPicture.asset('lib/assets/icons/hart.svg'),
  //     ),
  //     Container(
  //       height: 58,
  //       width: 58,
  //       decoration: BoxDecoration(
  //           color: Color.fromRGBO(239, 120, 34, 1),
  //           shape: BoxShape.circle,
  //           boxShadow: [
  //             BoxShadow(
  //               color: Color.fromRGBO(0, 0, 0, 0.08), //edited
  //               spreadRadius: 0,
  //               blurRadius: 4,
  //               offset: Offset(0, -3), //edited
  //             ),
  //           ]),
  //       child: Padding(
  //         padding: const EdgeInsets.all(18),
  //         child: SvgPicture.asset(
  //           'lib/assets/icons/shopping_cart.svg',
  //         ),
  //       ),
  //     ) // Icon(Icons.shop),

  //     ,
  //     SvgPicture.asset('lib/assets/icons/bookMark.svg'),
  //     SvgPicture.asset('lib/assets/icons/menu.svg')
  //   ];
  // }

  int _currentIndex = 0;
  void _onTop(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> _list = [
    HomeScreen(),
    FavoritScreen(),
    OrderScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  Color currentColor(int index) {
    return _currentIndex == index
        ? AppColor.viewButtonTextColor
        : AppColor.unselectItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _list.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        // selectedItemColor: AppColor.viewButtonTextColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        // unselectedItemColor: Color(0xffB5B5B5),

        elevation: 10,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(
                'lib/assets/icons/home.svg',
                color: _currentIndex == 0
                    ? AppColor.viewButtonTextColor
                    : AppColor.unselectItem,
              )),
          BottomNavigationBarItem(
            label: '',
            icon: SvgPicture.asset(
              'lib/assets/icons/hart.svg',
              color: _currentIndex == 1
                  ? AppColor.viewButtonTextColor
                  : AppColor.unselectItem,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            // icon: SvgPicture.asset('lib/assets/icons/shopping_cart.svg'),
            icon: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: AppColor.viewButtonTextColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.08), //edited
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, -3), //edited
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'lib/assets/icons/shopping_cart.svg',
                  color: _currentIndex == 2
                      ? AppColor.viewButtonTextColor
                      : Colors.white,
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(
                'lib/assets/icons/bookMark.svg',
                color: currentColor(3),
              )),
          BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(
                'lib/assets/icons/menu.svg',
                color: currentColor(4),
              )),
        ],
        currentIndex: _currentIndex,
        onTap: _onTop,
      ),
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     boxShadow: [
      //       BoxShadow(
      //         color: Color.fromRGBO(0, 0, 0, 0.1),

      //         spreadRadius: 0,
      //         blurRadius: 10,
      //         offset: Offset(0, -3), // changes position of shadow
      //       ),
      //     ],
      //   ),
      //   height: 60,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: widgetList(),
      //   ),
      // ),
    );
  }
}
