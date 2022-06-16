import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:newapp/custom%20widgets/category_tile.dart';
import 'package:newapp/presentation/screens/dashboard/class_routine/class_list.dart';
import 'package:newapp/presentation/screens/dashboard/hall_availibility/hall_list.dart';
import 'package:newapp/presentation/screens/dashboard/list_of_lectures/lecture_list.dart';
import 'package:newapp/presentation/screens/dashboard/module_list/module_list.dart';
import 'package:newapp/presentation/screens/dashboard/module_list/specification_list.dart';
import 'package:newapp/presentation/screens/dashboard/teacher_availibility/teacher_details.dart';
import 'package:newapp/presentation/styling/color.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: IslingtonColors.L_RED,
      appBar: AppBar(
        title: Text("Islington"),
        backgroundColor: IslingtonColors.Purple,
      ),
      body: Column(
        children: [
          CategoryTileWidget(
            tileTitle: "List of Modules",
            icon: Icons.book,
            tapFunction: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  SpecificationListPage(),
                  ));
            },
          ),
          CategoryTileWidget(
            tileTitle: "List of Lectures",
            icon: Icons.reduce_capacity,
            tapFunction: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LectureListPage(),
                  ));
            },
          ),
          
          CategoryTileWidget(
            tileTitle: "Class Routine",
            icon: Icons.calendar_month,
            tapFunction: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ClassListPage(),
                  ));
            },
          ),
          CategoryTileWidget(
            tileTitle: "Hall availibility",
            icon: Icons.room_preferences_outlined,
            tapFunction: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HallListPage(),
                  ));
            },
          ),
          CategoryTileWidget(
            tileTitle: "Teacher availibility",
            icon: Icons.man_rounded,
            tapFunction: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TeacherAvailibilityPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
