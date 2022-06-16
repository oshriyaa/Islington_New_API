import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:newapp/presentation/screens/dashboard/class_routine/routine.dart';

import '../../../../custom widgets/category_tile.dart';
import '../../../../model/model.dart';
import '../../../../network/api.dart';
import '../../../styling/color.dart';
import '../../../styling/textstyle.dart';

class ClassListPage extends StatefulWidget {
  const ClassListPage({Key? key}) : super(key: key);

  @override
  State<ClassListPage> createState() => _ClassListPageState();
}

class _ClassListPageState extends State<ClassListPage> {
  List newList = [];
  List uniquelist = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: IslingtonColors.L_RED,
      appBar: AppBar(
        title: Text("Group List"),
        backgroundColor: IslingtonColors.Purple,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          FutureBuilder(
              future: IslingtonApiService().getList(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  int firstIndex = snapshot.data.length;
                  for (var i = 0; i < firstIndex; i++) {
                    final firstData = snapshot.data[i];
                    int secondIndex = firstData["groupList"].length;

                    for (var j = 0; j < secondIndex; j++) {
                      final secondData = firstData["groupList"][j];

                      newList.add(secondData["name"]);

                      var trial = newList.toSet();
                      uniquelist = trial.toList();
                    }
                    
                  }
                  print(uniquelist);
                    uniquelist.sort();
                    return Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: uniquelist.length,
                        itemBuilder: (context, builderIndex) {
                          final item = uniquelist[builderIndex];

                          return ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RoutinePage(groupName: uniquelist[builderIndex] ,),
                                  ));
                            },
                            title: Padding(
                              padding: const EdgeInsets.only(top: 7),
                              child: Container(
                                width: size.width * 0.9,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: IslingtonColors.WHITE,
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 2, offset: Offset(2, 2))
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 13, vertical: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Text("Group Name: ",
                                              style: StyleText.featureHeading),
                                          Text(
                                            uniquelist[builderIndex],
                                            style: StyleText.categoryHeading,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );

                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return const CircularProgressIndicator();
                }
              })
        ]),
      ),
    );
  }
}
