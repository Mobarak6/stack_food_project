import 'package:flutter/material.dart';
import 'package:stack_food/model/categories.dart';
import 'package:stack_food/model/food.dart';
import 'package:stack_food/model/restaurants.dart';

class DataList with ChangeNotifier {
  //All category list
  List<Categories> _categorisList = [
    Categories('All', "lib/assets/categoris/fast-food.svg"),
    Categories('Coffee', "lib/assets/categoris/cup.svg"),
    Categories('Drink', "lib/assets/categoris/cola.svg"),
    Categories('Fast Food', "lib/assets/categoris/burger.svg"),
    Categories('Cake', "lib/assets/categoris/muffin.svg"),
    Categories('Sushi', "lib/assets/categoris/cola.svg"),
    //no need to call notifyListener
  ];
  //acess for category list
  List<Categories> get getCategorisList {
    return [..._categorisList];
  }

//all restaurant list
  List<Restaurant> restaurantList = [
    Restaurant(
      'Hungry Puppets',
      'American cuisine',
      'lib/assets/popularRestaurants/benar1.png',
      '30% off',
      '76A eighth evenue, New York, US',
      2,
      DateTime.now(),
      'fast food',
    ),
    Restaurant(
      'Hungry Puppets',
      'American cuisine',
      'lib/assets/popularRestaurants/benar1.png',
      null,
      '76A eighth evenue, New York, US',
      1,
      DateTime.now(),
      'fast food',
    ),
    Restaurant(
      'Mc Donald\'s',
      'American cuisine',
      'lib/assets/foodCampaign/cake.png',
      '50% off',
      '76A eighth evenue, New York, US',
      3,
      DateTime.now(),
      'fast food',
    ),
    Restaurant(
      'Mc Donald\'s',
      'New York, US',
      'lib/assets/foodCampaign/cake.png',
      '50% off',
      '76A eighth evenue, ',
      3,
      DateTime(2020),
      'fast food',
    ),
    Restaurant(
      'Mc Donald\'s',
      'American cuisine',
      'lib/assets/popularRestaurants/mcDonald.png',
      null,
      '76A eighth evenue, New York, US',
      3,
      DateTime.now(),
      'fast food',
    ),
    Restaurant(
      'Starbuks',
      'American cuisine',
      'lib/assets/popularRestaurants/starbuks.png',
      null,
      '76A eighth evenue, New York, US',
      2,
      DateTime(2020),
      'fast food',
    ),
    Restaurant(
      'Dominos',
      'American cuisine',
      'lib/assets/popularRestaurants/domino.png',
      '30% off',
      '76A eighth evenue, New York, US',
      4,
      DateTime(2020),
      'fast food',
    ),
    Restaurant(
      'Dominos',
      'American cuisine',
      'lib/assets/popularRestaurants/domino.png',
      'Free Delivery',
      '76A eighth evenue, New York, US',
      4,
      DateTime(2020),
      'fast food',
    ),
    //no need to call notifyListener
  ];

  //get new Restaurants
  List<Restaurant> get newResturants {
    List<Restaurant> newResturant = [];
    restaurantList.forEach((element) {
      if (element.dateTime.day == DateTime.now().day) {
        newResturant.add(element);
      }
    });
    return newResturant;
  }

  //get popular Restaurants
  List<Restaurant> get popularResturants {
    List<Restaurant> popularResturant = [];
    restaurantList.forEach((element) {
      if (element.dateTime.day != DateTime.now().day) {
        popularResturant.add(element);
      }
    });
    return popularResturant;
  }

  //food list
  List<FoodModel> foodList = [
    FoodModel(
      'Burger',
      'lib/assets/popular_nearby/barger.png',
      5,
      10,
      Restaurant(
        'Mc Donald\'s',
        'American cuisine',
        'lib/assets/popular_nearby/barger.png',
        '30% off',
        '76A eighth evenue, New York, US',
        3,
        DateTime.now(),
        'fast food',
      ),
      false,
    ),
    FoodModel(
      'Burger',
      'lib/assets/popular_nearby/pasta.png',
      5,
      10,
      Restaurant(
        'Mc Donald\'s',
        'American cuisine',
        'lib/assets/popularRestaurants/mcDonald.png',
        null,
        '76A eighth evenue, New York, US',
        3,
        DateTime.now(),
        'fast food',
      ),
      false,
    ),
    FoodModel(
      'Burger',
      'lib/assets/foodCampaign/foodCampain1.png',
      5,
      10,
      Restaurant(
        'Mc Donald\'s',
        'American cuisine',
        'lib/assets/foodCampaign/cake.png',
        '50% off',
        '76A eighth evenue, New York, US',
        3,
        DateTime.now(),
        'fast food',
      ),
      true,
    ),
    FoodModel(
      'Burger',
      'lib/assets/popular_nearby/barger.png',
      5,
      10,
      Restaurant(
        'Mc Donald\'s',
        'American cuisine',
        'lib/assets/popularRestaurants/mcDonald.png',
        null,
        '76A eighth evenue, New York, US',
        3,
        DateTime.now(),
        'fast food',
      ),
      false,
    ),
    FoodModel(
      'Burger',
      'lib/assets/foodCampaign/foodCampain2.png',
      5,
      10,
      Restaurant(
        'Mc Donald\'s',
        'New York, US',
        'lib/assets/foodCampaign/foodCampain2.png',
        'Free Delivery',
        '76A eighth evenue, ',
        3,
        DateTime.now(),
        'fast food',
      ),
      true,
    ),
    FoodModel(
      'Burger',
      'lib/assets/foodCampaign/three.png',
      5,
      10,
      Restaurant(
        'Mc Donald\'s',
        'New York, US',
        'lib/assets/foodCampaign/three.png',
        'Free Delivery',
        '76A eighth evenue, ',
        3,
        DateTime.now(),
        'fast food',
      ),
      true,
    ),
    FoodModel(
      'Cake',
      'lib/assets/foodCampaign/cake.png',
      5,
      10,
      Restaurant(
        'Mc Donald\'s',
        'New York, US',
        'lib/assets/foodCampaign/cake.png',
        '50% off',
        '76A eighth evenue, ',
        3,
        DateTime(2020),
        'fast food',
      ),
      true,
    )
  ];

  //food Campaign list
  List<FoodModel> get foodCampaign {
    List<FoodModel> campaignList = [];
    foodList.forEach((element) {
      if (element.campaign) {
        campaignList.add(element);
      }
    });
    return campaignList;
  }
}
