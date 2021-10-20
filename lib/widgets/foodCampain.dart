import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stack_food/model/dataList.dart';
import 'package:stack_food/widgets/categorisWidget.dart';
import 'package:stack_food/widgets/popularFood.dart';

import 'foodInfo.dart';

class FoodCampain extends StatelessWidget {
  const FoodCampain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 17, bottom: 10),
          child: TitleWidget(
            titleName: 'Food Campaign',
          ),
        ),
        Consumer<DataList>(builder: (context, snapshot, _) {
          return Container(
            height: 205,
            margin: EdgeInsets.only(right: 10, left: 17),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.foodCampaign.length,
                itemBuilder: (context, item) => Container(
                      width: 160,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: Color(0xffDADADA), width: 1)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              snapshot.foodCampaign[item].image,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 131,
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Container(
                                padding: EdgeInsets.only(top: 7, left: 10),
                                color: Colors.white,
                                child: FoodInfoWidget(
                                  foodModel: snapshot.foodCampaign[item],
                                  widthSize: 140,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
          );
        })
      ],
    );
  }
}
