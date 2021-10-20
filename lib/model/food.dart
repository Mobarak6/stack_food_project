import 'package:stack_food/model/restaurants.dart';

class FoodModel {
  final String foodName;
  final String image;
  final double discountPrice;
  final double initPrice;
  final Restaurant restaurant;

  final bool campaign;

  FoodModel(
    this.foodName,
    this.image,
    this.discountPrice,
    this.initPrice,
    this.restaurant,
    this.campaign,
  );
}
