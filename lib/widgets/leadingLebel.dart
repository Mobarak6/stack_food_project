import 'package:flutter/material.dart';
import 'package:stack_food/model/Colors.dart';

class LeadingLebel extends StatelessWidget {
  String? title;

  LeadingLebel({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.005)
        ..rotateY(0.6),
      alignment: FractionalOffset.center,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
          color: AppColor.lebelStack,
        ),
        child: Text(
          title!,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
