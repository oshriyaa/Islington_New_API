import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:newapp/presentation/screens/dashboard/module_list/semester_list.dart';

import '../../../../custom widgets/category_tile.dart';
import '../../../styling/color.dart';
import 'module_list.dart';

class YearListPage extends StatelessWidget {
  String? yearModule;
  YearListPage({this.yearModule, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: IslingtonColors.L_RED,
      appBar: AppBar(
        title: Text("List of years"),
        backgroundColor: IslingtonColors.Purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoryTileWidget(
              tileTitle: "Year 1",
              icon: Icons.book,
              tapFunction: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SemesterListPage(
                        moduleSem: this.yearModule,
                        yearSem: "1",
                      ),
                    ));
              },
            ),
            CategoryTileWidget(
              tileTitle: "Year 2",
              icon: Icons.book,
              tapFunction: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SemesterListPage(
                        moduleSem: this.yearModule,
                        yearSem: "2",
                      ),
                    ));
              },
            ),
            CategoryTileWidget(
              tileTitle: "Year 3",
              icon: Icons.book,
              tapFunction: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SemesterListPage(
                        moduleSem: this.yearModule,
                        yearSem: "2",
                      ),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
