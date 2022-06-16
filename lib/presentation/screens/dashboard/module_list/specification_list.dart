import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:newapp/presentation/screens/dashboard/module_list/module_list.dart';
import 'package:newapp/presentation/screens/dashboard/module_list/semester_list.dart';
import 'package:newapp/presentation/screens/dashboard/module_list/year_list.dart';

import '../../../../custom widgets/category_tile.dart';
import '../../../styling/color.dart';

class SpecificationListPage extends StatelessWidget {
  const SpecificationListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold( backgroundColor: IslingtonColors.L_RED,
      appBar: AppBar(
        title: const Text("Specialization List"),
        backgroundColor: IslingtonColors.Purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoryTileWidget(
              tileTitle: "Computing",
              icon: Icons.computer,
              tapFunction: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => YearListPage(yearModule: "C",),
                    ));
              },
            ),
            CategoryTileWidget(
              tileTitle: "Networking",
              icon: Icons.wifi_rounded,
              tapFunction: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  YearListPage(yearModule: "N",),
                    ));
              },
            ),
            CategoryTileWidget(
              tileTitle: "Multimedia",
              icon: Icons.video_camera_back,
              tapFunction: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  YearListPage(yearModule: "M",),
                    ));
              },
            ),
          ],
        ),
      ),
      );
  }
}
