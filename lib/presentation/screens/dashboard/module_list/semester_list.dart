import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../custom widgets/category_tile.dart';
import '../../../styling/color.dart';
import 'module_list.dart';

class SemesterListPage extends StatelessWidget {
  String? moduleSem;
  String? yearSem;
  SemesterListPage({this.moduleSem, this.yearSem, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: IslingtonColors.L_RED,
      appBar: AppBar(
        title: Text("List of semesters"),
        backgroundColor: IslingtonColors.Purple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoryTileWidget(
              tileTitle: "Semester 1",
              icon: Icons.auto_stories,
              tapFunction: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ModuleListPage(
                        module: moduleSem,
                        semester: "1",
                        year: yearSem,
                      ),
                    ));
              },
            ),
            CategoryTileWidget(
              tileTitle: "Semester 2",
              icon: Icons.auto_stories,
              tapFunction: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ModuleListPage(
                        module: moduleSem,
                        year: yearSem,
                        semester: "2",
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
