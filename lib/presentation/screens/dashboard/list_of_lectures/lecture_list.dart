import 'package:flutter/material.dart';

import '../../../../network/api.dart';
import '../../../styling/color.dart';
import '../../../styling/textstyle.dart';

class LectureListPage extends StatefulWidget {
  const LectureListPage({Key? key}) : super(key: key);

  @override
  State<LectureListPage> createState() => _LectureListPageState();
}

class _LectureListPageState extends State<LectureListPage> {
  String firstDropDown = 'Programming';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: IslingtonColors.L_RED,
          appBar: AppBar(
            title: Text("Lecture Details"),
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
                          print(firstDropDown);
                        },
                        items: <String>[
                          'Programming',
                          'Introduction to Information Systems',
                          'Computer Hardware & Software Architectures',
                          'Fundamentals of Computing',
                          'Application Development',
                          'Advanced Database Systems Development',
                          'Sound Design and Music Production',
                          'Emerging Programming Platforms and Technologies',
                          'Professional Issues, Ethics and Computer Law',
                          'Networks & Operating Systems',
                          'Software Engineering',
                          'Logic and Problem Solving',
                          'Leading Innovation & Entrepreneurship',
                          'Management Investigation and Dissertation',
                          'Strategy: Choices & Change',
                          'Digital Design and Image Making',
                          'Visual Effects for Computer Graphics and Games'
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
              FutureBuilder(
                  future: IslingtonApiService().getList(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      print(snapshot.data);
                      return Column(
                          children:
                              List.generate(snapshot.data!.length, (index) {
                        final data = snapshot.data![index];
                        String cType = data["moduleDto"]["name"];
                        return cType == firstDropDown
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
                                              const Text("Module Code: ",
                                                  style:
                                                      StyleText.featureHeading),
                                              Text(
                                                "${data["moduleDto"]["code"]}",
                                                style:
                                                    StyleText.categoryHeading,
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
                                                  style: StyleText
                                                      .categoryHeading),
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
                                              Text(" ${data["roomDto"]["name"]}",
                                                  style: StyleText
                                                      .categoryHeading),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              const Text("Block",
                                                  style:
                                                      StyleText.featureHeading),
                                              Text(" ${data["roomDto"]["block"]}",
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



// class LectureListPage extends StatelessWidget {
//   const LectureListPage({Key? key}) : super(key: key);


// }
