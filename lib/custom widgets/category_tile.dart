import 'package:flutter/material.dart';
import 'package:newapp/presentation/styling/color.dart';
import 'package:newapp/presentation/styling/textstyle.dart';

class CategoryTileWidget extends StatelessWidget {
  final String? tileTitle;
  final IconData? icon;
  final String? image;
  final Function()? tapFunction;
  const CategoryTileWidget({
    Key? key,
    this.tileTitle,
    this.image,
    this.tapFunction,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 90,
            width: size.width * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: IslingtonColors.WHITE,
                boxShadow: const [
                  BoxShadow(blurRadius: 2, offset: Offset(2, 2))
                ]),
            child: Center(
              child: ListTile(
                onTap: tapFunction,
                leading: Icon(
                  icon,
                  size: 50,
                  color: IslingtonColors.Purple,
                ),
                title: Text(tileTitle!, style: StyleText.categoryHeading),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
