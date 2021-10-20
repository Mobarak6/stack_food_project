import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stack_food/model/Colors.dart';
import 'package:stack_food/model/dataList.dart';
import 'package:stack_food/model/restaurants.dart';
import 'package:stack_food/widgets/categorisWidget.dart';
import 'package:stack_food/widgets/leadingLebel.dart';

class NewRestaurants extends StatelessWidget {
  const NewRestaurants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 17, top: 20, bottom: 10),
          child: TitleWidget(titleName: 'New On App Name'),
        ),
        Consumer<DataList>(builder: (context, snapshot, _) {
          return RestaurantRender(restaurants: snapshot.newResturants);
        }),
      ],
    );
  }
}

class RestaurantRender extends StatelessWidget {
  final List<Restaurant> restaurants;
  const RestaurantRender({
    Key? key,
    required this.restaurants,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 225,
        margin: EdgeInsets.only(bottom: 20),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: restaurants.length,
            itemBuilder: (context, item) {
              return Container(
                padding: const EdgeInsets.only(bottom: 5, top: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: 0,
                        offset: Offset(-1, 4),
                        color: AppColor.dropShadow,
                      )
                    ]),
                margin: const EdgeInsets.only(left: 17),
                child: Stack(
                  children: [
                    Container(
                      height: 225,
                      width: 302,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(
                          restaurants[item].coverPageImageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 148,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  restaurants[item].restaurantName,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  restaurants[item].address,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto',
                                    color: Color(0xffB2B2B2),
                                  ),
                                ),
                                Row(
                                  children: [
                                    RatingBar.builder(
                                      initialRating: 5,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: EdgeInsets.zero,
                                      itemSize: 9,
                                      itemBuilder: (context, _) =>
                                          SvgPicture.asset(
                                        'lib/assets/popular_nearby/star.svg',
                                        color: Color(0xffEF7822),
                                      ),
                                      onRatingUpdate: (rating) {},
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      '(${restaurants[item].rating})',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Roboto',
                                        color: Color(0xffB2B2B2),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ),
                    Positioned(
                      right: 8.77,
                      top: 8,
                      child: Container(
                        height: 18.29,
                        width: 18.29,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: SizedBox(
                          child: SvgPicture.asset(
                              'lib/assets/icons/makeFavorite.svg'),
                        ),
                      ),
                    ),
                    restaurants[item].discount != null
                        ? Positioned(
                            left: -5,
                            top: 8,
                            child:
                                LeadingLebel(title: restaurants[item].discount))
                        : SizedBox(),
                  ],
                ),
              );
            }));
  }
}
