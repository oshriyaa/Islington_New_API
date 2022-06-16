import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../network/api.dart';
import '../../../styling/color.dart';
import '../../../styling/textstyle.dart';

class RoutinePage extends StatelessWidget {
  String? groupName;
  RoutinePage({this.groupName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: IslingtonColors.L_RED,
      appBar: AppBar(
        title: Text("Routine for ${groupName}"),
        backgroundColor: IslingtonColors.Purple,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          FutureBuilder(
              future: IslingtonApiService().getList(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Column(
                      children: List.generate(snapshot.data!.length, (index) {
                    final data = snapshot.data![index];
                    return Column(
                        children: List.generate(
                            snapshot.data![index]["groupList"].length,
                            (index2) {
                      final data2 = snapshot.data![index]["groupList"][index2];
                      String gName = data2["name"];

                      return gName == groupName
                          ? ListTile(
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
                                            const Text("Lecture ID: ",
                                                style:
                                                    StyleText.featureHeading),
                                            Text(
                                              "${data["id"]}",
                                              style: StyleText.categoryHeading,
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            const Text("Class Type: ",
                                                style:
                                                    StyleText.featureHeading),
                                            Text(" ${data["classType"]}",
                                                style:
                                                    StyleText.categoryHeading),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Text("Module Name: ",
                                                style:
                                                    StyleText.featureHeading),
                                            Container(
                                              // color: Colors.black,
                                              width: size.width * 0.45,
                                              child: Text(
                                                "${data["moduleDto"]["name"]}",
                                                style:
                                                    StyleText.categoryHeading,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Text("Module Code: ",
                                                style:
                                                    StyleText.featureHeading),
                                            Text(
                                              "${data["moduleDto"]["code"]}",
                                              style: StyleText.categoryHeading,
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Text("Specialization: ",
                                                style:
                                                    StyleText.featureHeading),
                                            Text(" ${data["specialization"]}",
                                                style:
                                                    StyleText.categoryHeading),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Text("Teacher: ",
                                                style:
                                                    StyleText.featureHeading),
                                            Container(
                                              width: size.width * 0.6,
                                              // color: Colors.black,
                                              child: Text(
                                                  " ${data["userDto"]["name"]}",
                                                  style: StyleText
                                                      .categoryHeading),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Text("Day:",
                                                style:
                                                    StyleText.featureHeading),
                                            Text(" ${data["day"]}",
                                                style:
                                                    StyleText.categoryHeading),
                                          ],
                                        ),

                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Text("Group:",
                                                style:
                                                    StyleText.featureHeading),
                                            Text(" ${data2["name"]}",
                                                style:
                                                    StyleText.categoryHeading),
                                          ],
                                        ),
                                        
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Text("Start",
                                                style:
                                                    StyleText.featureHeading),
                                            Text(" ${data["startTime"]}",
                                                style:
                                                    StyleText.categoryHeading),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            const Text("End",
                                                style:
                                                    StyleText.featureHeading),
                                            Text(" ${data["endTime"]}",
                                                style:
                                                    StyleText.categoryHeading),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Text("Room",
                                                style:
                                                    StyleText.featureHeading),
                                            Text(" ${data["roomDto"]["name"]}",
                                                style:
                                                    StyleText.categoryHeading),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            const Text("Block",
                                                style:
                                                    StyleText.featureHeading),
                                            Text(" ${data["roomDto"]["block"]}",
                                                style:
                                                    StyleText.categoryHeading),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(
                              height: 0,
                            );
                    }));
                  }));
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ]),
      ),
    );
  }
}
