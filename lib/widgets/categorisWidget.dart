import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';

import 'package:stack_food/model/dataList.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      height: 107,
      margin: EdgeInsets.only(left: 17),
      //
      child: Column(
        children: [
          TitleWidget(titleName: 'Categories'),
          Consumer<DataList>(
            builder: (context, snapshot, _) => Container(
              margin: EdgeInsets.only(top: 10),
              height: 76,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.getCategorisList.length,
                  itemBuilder: (context, item) {
                    return Container(
                      //color: Colors.red,
                      margin: EdgeInsets.only(right: 15),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  const BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.08),
                                    blurRadius: 12,
                                    spreadRadius: 0,
                                    offset: Offset(0, 3),
                                  )
                                ]),
                            //color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset(
                                snapshot.getCategorisList[item].imageLink,
                              ),
                            ),
                          ),
                          Text(
                            snapshot.getCategorisList[item].title,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  final String titleName;
  const TitleWidget({
    Key? key,
    required this.titleName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(left: 17),
      height: 21,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleName,
            style: Theme.of(context).textTheme.headline6,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 13),
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Button is clicked')));
              },
              child: Text(
                'View All',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
