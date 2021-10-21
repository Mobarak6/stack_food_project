import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:stack_food/model/Colors.dart';
import 'package:stack_food/model/dataList.dart';

import 'package:stack_food/widgets/categorisWidget.dart';
import 'package:stack_food/widgets/leadingLebel.dart';

import 'foodInfo.dart';

class NearbyFoood extends StatelessWidget {
  const NearbyFoood({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 17, top: 20),
          child: TitleWidget(titleName: 'Popular Food Nearby'),
        ),
        Consumer<DataList>(builder: (context, snapshot, _) {
          return Container(
            height: 115,
            //padding: EdgeInsets.only(left: 17),
            //color: Colors.red,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, item) => Stack(
                children: [
                  Container(
                    height: 80,
                    margin: EdgeInsets.only(right: 10, top: 10, left: 17),

                    // padding: EdgeInsets.only(left: 17),
                    //  color: Colors.green,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 10,
                            spreadRadius: 0,
                            color: AppColor.dropShadow,
                          )
                        ]),
                    width: 200,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 12),
                          width: 71,
                          height: 72,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              snapshot.foodList[item].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: FoodInfoWidget(
                            foodModel: snapshot.foodList[item],
                            widthSize: 110,
                          ),
                        )
                      ],
                    ),
                  ),
                  snapshot.foodList[item].restaurant.discount != null
                      ? Positioned(
                          top: 27,
                          left: 7,
                          child: LeadingLebel(
                              title:
                                  snapshot.foodList[item].restaurant.discount),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          );
        })
      ],
    );
  }
}
