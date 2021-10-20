import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stack_food/model/Colors.dart';
import 'package:stack_food/model/food.dart';

class FoodInfoWidget extends StatelessWidget {
  final FoodModel foodModel;
  final double widthSize;

  const FoodInfoWidget({
    Key? key,
    required this.foodModel,
    required this.widthSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          foodModel.foodName,
          style: Theme.of(context).textTheme.headline6,
        ),
        FittedBox(
          child: Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: foodModel.restaurant.restaurantName + ', ',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppings',
                    color: AppColor.popUpUnselected,
                  ),
                ),
                TextSpan(
                  text: foodModel.restaurant.discription,
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppings',
                    color: AppColor.popUpUnselected,
                  ),
                ),
              ],
            ),
          ),
        ),
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.zero,
          itemSize: 9,
          itemBuilder: (context, _) => SvgPicture.asset(
            'lib/assets/popular_nearby/star.svg',
            color: AppColor.viewButtonTextColor,
          ),
          onRatingUpdate: (rating) {
            ///...
          },
        ),
        Container(
          width: widthSize,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${foodModel.discountPrice.toInt()}',
                    style: TextStyle(
                      color: AppColor.titleTextColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Stack(
                    children: [
                      Text(
                        '\$${foodModel.initPrice.toInt()}',
                        style: TextStyle(
                          color: Color(0xff9F9F9F),
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Positioned(
                        top: 1,
                        child: SvgPicture.asset('lib/assets/icons/line.svg'),
                      )
                    ],
                  ),
                ],
              ),
              SvgPicture.asset('lib/assets/popular_nearby/add.svg')
            ],
          ),
        )
      ],
    );
  }
}
