import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              child: Row(
                children: [
                  SvgPicture.asset('lib/assets/icons/appBarLeading.svg'),
                  SizedBox(width: 5),
                  Text(
                    '76A eighth evenue, New York, US',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffB2B2B2),
                      fontFamily: 'Poppings',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SvgPicture.asset('lib/assets/icons/notification.svg'),
        ],
      ),
    );
  }
}
