import 'package:flutter/material.dart';
import 'package:newapp/presentation/styling/color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool automaticallyImplyLeading;
  const CustomAppBar(
      {Key? key, required this.title, required this.automaticallyImplyLeading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.blueGrey),
      // automaticallyImplyLeading: this.automaticallyImplyLeading,
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: "Nunito",
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: IslingtonColors.Purple,
        ),
      ),
      backgroundColor: IslingtonColors.Purple,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}
