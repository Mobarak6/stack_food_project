import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stack_food/model/Colors.dart';
import 'package:stack_food/model/dataList.dart';
import 'package:stack_food/widgets/leadingLebel.dart';

class AllRestaurants extends StatelessWidget {
  const AllRestaurants({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  dynamic popUpMenuList(BuildContext context) {
    var list = <PopupMenuEntry<Object>>[];
    list.add(
      PopupMenuItem(
        height: 29,
        child: Text(
          'All',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: AppColor.titleTextColor,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ),
    );
    list.add(
      PopupMenuDivider(
        height: 1,
      ),
    );
    list.add(
      PopupMenuItem(
        height: 29,
        child: Text(
          'Take Away',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: AppColor.popUpUnselected,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ),
    );
    list.add(
      PopupMenuDivider(
        height: 1,
      ),
    );
    list.add(
      PopupMenuItem(
        height: 29,
        child: Text(
          'Home Delivery',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: AppColor.popUpUnselected,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ),
    );
    return list;
  }

  _showPopupMenu(Offset offset, BuildContext context) async {
    double left = offset.dx;
    double top = offset.dy;
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, top, 0, 0),
      items: popUpMenuList(context),
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataList>(builder: (context, snapshot, _) {
      return Container(
        height: screenSize.height * 0.37,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 17,
                right: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'All Restaurants',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        '${snapshot.restaurantList.length}+ ' + 'Near you',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: AppColor.popUpUnselected,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTapUp: (TapUpDetails details) {
                      _showPopupMenu(details.globalPosition, context);
                    },
                    child: SvgPicture.asset('lib/assets/icons/menuPopup.svg'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  // scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, item) {
                    return Column(
                      children: [
                        Container(
                          height: 80,
                          child: ListTile(
                            leading: Stack(
                              children: [
                                Container(
                                  height: 65,
                                  width: 83,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      snapshot.restaurantList[item]
                                          .coverPageImageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                snapshot.restaurantList[item].discount != null
                                    ? Positioned(
                                        top: 5,
                                        left: -5,
                                        child: LeadingLebel(
                                            title: snapshot
                                                .restaurantList[item].discount))
                                    : SizedBox(),
                              ],
                            ),
                            trailing: Container(
                              height: 65,
                              child: SvgPicture.asset(
                                'lib/assets/icons/listTileFav.svg',
                              ),
                            ),
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.restaurantList[item].restaurantName,
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Text(
                                  snapshot.restaurantList[item].discription +
                                      '\n' +
                                      snapshot.restaurantList[item].type,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins',
                                    color: Color(0xff888888),
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
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: Color(0xffE2E2E2),
                          height: 1,
                        )
                      ],
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }
}
