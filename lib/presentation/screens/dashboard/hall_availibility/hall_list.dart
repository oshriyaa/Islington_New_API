import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:newapp/presentation/screens/dashboard/hall_availibility/hall_routine.dart';

import '../../../../custom widgets/category_tile.dart';
import '../../../styling/color.dart';

class HallListPage extends StatelessWidget {
  const HallListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: IslingtonColors.L_RED,
      appBar: AppBar(
        title: Text("Hall List"),
        backgroundColor: IslingtonColors.Purple,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          CategoryTileWidget(
            tileTitle: "Kumari: Hall - 01",
            icon: Icons.room,
            tapFunction: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HallAvailibilityPage(hallNumber: '1',)));
            },
          ),
          CategoryTileWidget(
            tileTitle: "Kumari: Hall - 02",
            icon: Icons.room,
            tapFunction: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HallAvailibilityPage(hallNumber: '2',)));
            },
          ),
        ]),
      ),
    );
  }
}
