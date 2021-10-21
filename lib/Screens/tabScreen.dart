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

  Widget get bottomWidget {
    return Container(
      height: 60,
      margin: EdgeInsets.only(top: 3),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              label: 'Home',
              icon: SvgPicture.asset(
                'lib/assets/icons/home.svg',
                color: currentColor(0),
              )),
          BottomNavigationBarItem(
            label: 'Favorite',
            icon: SvgPicture.asset(
              'lib/assets/icons/hart.svg',
              color: currentColor(1),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Shop',
            icon: Container(
              height: 58,
              width: 58,
              decoration: BoxDecoration(
                  color: _currentIndex == 2
                      ? Colors.white
                      : AppColor.viewButtonTextColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.08), //edited
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, -3), //edited
                    ),
                  ]),
              child: Container(
                margin: EdgeInsets.all(15),
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
              label: 'Cart',
              icon: SvgPicture.asset(
                'lib/assets/icons/bookMark.svg',
                color: currentColor(3),
              )),
          BottomNavigationBarItem(
              label: 'Profile',
              icon: SvgPicture.asset(
                'lib/assets/icons/menu.svg',
                color: currentColor(4),
              )),
        ],
        currentIndex: _currentIndex,
        selectedFontSize: 0,
        onTap: _onTop,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _list.elementAt(_currentIndex),
      bottomNavigationBar: bottomWidget,
    );
  }
}
