import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stack_food/model/dataList.dart';
import 'package:stack_food/widgets/categorisWidget.dart';
import 'package:stack_food/widgets/newRestaurant.dart';

class PopularRestaurants extends StatelessWidget {
  const PopularRestaurants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 17, top: 20, bottom: 10),
          child: TitleWidget(titleName: 'Popular Restaurants'),
        ),
        Consumer<DataList>(builder: (context, snapshot, _) {
          return RestaurantRender(restaurants: snapshot.popularResturants);
        })
      ],
    );
  }
}
