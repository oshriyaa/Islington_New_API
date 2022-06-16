import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../network/api.dart';
import '../../../styling/color.dart';
import '../../../styling/textstyle.dart';

class HallAvailibilityPage extends StatefulWidget {
  String hallNumber;
  HallAvailibilityPage({required this.hallNumber, Key? key}) : super(key: key);

  @override
  State<HallAvailibilityPage> createState() => _HallAvailibilityPageState();
}

class _HallAvailibilityPageState extends State<HallAvailibilityPage> {
  String firstDropDown = 'SUN';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: IslingtonColors.L_RED,
      appBar: AppBar(
        title: Text("Hall Occupied List"),
        backgroundColor: IslingtonColors.Purple,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Column(
                    children: [
                      Text("Hall Name: Kumari: Hall - 0${widget.hallNumber}",
                         style: StyleText.featureHeading),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Select Day",
                        style: StyleText.questionFont,
                      ),
                    ],
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
                    value: firstDropDown,
                    icon: const Icon(
                      Icons.arrow_downward,
                      color: CustomColors.RED,
                    ),
                    elevation: 10,
                    onChanged: (String? newValue) {
                      setState(() {
                        firstDropDown = newValue!.toString();
                      });
                    },
                    items: <String>['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: StyleText.categoryHeading),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
          FutureBuilder(
              future: IslingtonApiService().getList(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Column(
                      children: List.generate(snapshot.data!.length, (index) {
                    final data = snapshot.data![index];
                    String hData = data["roomDto"]["name"];
                    String dData = data["day"];

                    return hData.contains(widget.hallNumber) &&
                            dData == firstDropDown
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
                                          const Text("Start",
                                              style: StyleText.featureHeading),
                                          Text(" ${data["startTime"]}",
                                              style: StyleText.categoryHeading),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          const Text("End",
                                              style: StyleText.featureHeading),
                                          Text(" ${data["endTime"]}",
                                              style: StyleText.categoryHeading),
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
              }),
        ]),
      ),
    );
  }
}
