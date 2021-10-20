import 'package:flutter/material.dart';
import 'package:stack_food/model/Colors.dart';

class SearchBox extends StatelessWidget {
  final Size screenSize;
  const SearchBox({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin:
          EdgeInsets.only(left: 17, right: 16, top: screenSize.height * 0.035),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.07),
            spreadRadius: 0,
            blurRadius: 18,
            offset: Offset(0, 5),
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 12, color: AppColor.popUpUnselected),
          hintText: 'Search food or restaurent here...',
          suffixIcon: Icon(
            Icons.search,
            color: Color(0xff9B9B9B),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }
}
