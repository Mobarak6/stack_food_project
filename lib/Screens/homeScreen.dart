import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:stack_food/model/Colors.dart';

import 'package:stack_food/widgets/allRestaurants.dart';

import 'package:stack_food/widgets/appBarWidget.dart';
import 'package:stack_food/widgets/carouselSliderWidget.dart';
import 'package:stack_food/widgets/categorisWidget.dart';
import 'package:stack_food/widgets/customAppbar.dart';
import 'package:stack_food/widgets/foodCampain.dart';

import 'package:stack_food/widgets/newRestaurant.dart';
import 'package:stack_food/widgets/popularFood.dart';
import 'package:stack_food/widgets/popularRestaurants.dart';
import 'package:stack_food/widgets/searchBox.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeRoute';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          child: AppbarWidget(),
        ),
        backgroundColor: AppColor.BackgroundColor,
        body: Column(
          children: [
            SearchBox(),
            Expanded(
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  children: [
                    CarouselSliderWidget(),
                    CategoriesWidget(),
                    NearbyFoood(),
                    FoodCampain(),
                    PopularRestaurants(),
                    NewRestaurants(),
                    AllRestaurants(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
