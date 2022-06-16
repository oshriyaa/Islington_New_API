import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../network/api.dart';
import '../../../styling/color.dart';
import '../../../styling/textstyle.dart';

class TeacherAvailibilityPage extends StatefulWidget {
  const TeacherAvailibilityPage({Key? key}) : super(key: key);

  @override
  State<TeacherAvailibilityPage> createState() =>
      _TeacherAvailibilityPageState();
}

class _TeacherAvailibilityPageState extends State<TeacherAvailibilityPage> {
  String firstDropdown = 'Mr. Hrishav Tandukar';
  String secondDropdown = 'SUN';
  List teacherName = [];
  List uniqueName = [];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: IslingtonColors.L_RED,
          appBar: AppBar(
            title: Text("Teacher Details"),
            backgroundColor: IslingtonColors.Purple,
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text(
                        "Select Module",
                        style: StyleText.questionFont,
                      ),
                    ),
                  ),
                  Container(
                    // height: 35,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: CustomColors.WHITE,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 2,
                            offset: Offset(2, 2),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: firstDropdown,
                        icon: const Icon(
                          Icons.arrow_downward,
                          color: CustomColors.RED,
                        ),
                        elevation: 10,
                        onChanged: (String? newValue) {
                          setState(() {
                            firstDropdown = newValue!.toString();
                          });
                          print(firstDropdown);
                        },
                        items: <String>[
                          'Mr. Ujjwal Subedi',
                          'Mr. Hrishav Tandukar',
                          'Ms. Suman Gupta',
                          'Mr. Krishna Pandey',
                          'Mr. Himalay Sunuwar',
                          'Mr. Rohit Panday',
                          'Mr. Prabin Dangol',
                          'Mr. Prithivi Maharjan',
                          'Ms. Yunisha Bajracharya',
                          'Mr. Dipeshor Silwal',
                          'Mr. Subin Chitrakar',
                          'Mr. Ashok Dhungana',
                          'Mr. Surendra Raj Acharya',
                          'Mr. Navraj Bhusal',
                          'Mr. Prabhat Koirala',
                          'Mr. Pratik Man Singh Pradhan',
                          'Mr. Prabodh Tuladhar',
                          'Mr. Dibesh Maskey'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child:
                                Text(value, style: StyleText.categoryHeading),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text(
                    "Select Day",
                    style: StyleText.questionFont,
                  ),
                ),
              ),
              Container(
                // height: 35,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: CustomColors.WHITE,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 2,
                        offset: Offset(2, 2),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: secondDropdown,
                    icon: const Icon(
                      Icons.arrow_downward,
                      color: CustomColors.RED,
                    ),
                    elevation: 10,
                    onChanged: (String? newValue) {
                      setState(() {
                        secondDropdown = newValue!.toString();
                      });
                    },
                    items: <String>['SUN', 'MON', 'TUE', 'WED', 'THUR','FRI']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: StyleText.categoryHeading),
                      );
                    }).toList(),
                  ),
                ),
              ),
              FutureBuilder(
                  future: IslingtonApiService().getList(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      // print(snapshot.data);
                      return Column(
                          children:
                              List.generate(snapshot.data!.length, (index) {
                        final data = snapshot.data![index];
                        // print("${snapshot.data[index]["userDto"]["name"]}");
                        teacherName
                            .add(snapshot.data[index]["userDto"]["name"]);
                        // print(teacherName);
                        // print("==================================");
                        uniqueName = teacherName.toSet().toList();
                        // print(uniqueName);

                        String tName = data["userDto"]["name"];
                        String dData = data["day"];
                        return tName == firstDropdown && dData == secondDropdown
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
                                              blurRadius: 2,
                                              offset: Offset(2, 2))
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
                                                style:
                                                    StyleText.categoryHeading,
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              const Text("Class Type: ",
                                                  style:
                                                      StyleText.featureHeading),
                                              Text(" ${data["classType"]}",
                                                  style: StyleText
                                                      .categoryHeading),
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
                                              const Text("Day:",
                                                  style:
                                                      StyleText.featureHeading),
                                              Text(" ${data["day"]}",
                                                  style: StyleText
                                                      .categoryHeading),
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
                                                  style: StyleText
                                                      .categoryHeading),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              const Text("End",
                                                  style:
                                                      StyleText.featureHeading),
                                              Text(" ${data["endTime"]}",
                                                  style: StyleText
                                                      .categoryHeading),
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
                                              Text(
                                                  " ${data["roomDto"]["name"]}",
                                                  style: StyleText
                                                      .categoryHeading),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              const Text("Block",
                                                  style:
                                                      StyleText.featureHeading),
                                              Text(
                                                  " ${data["roomDto"]["block"]}",
                                                  style: StyleText
                                                      .categoryHeading),
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
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return const CircularProgressIndicator();
                    }
                  })
            ]),
          )),
    );
  }
}
