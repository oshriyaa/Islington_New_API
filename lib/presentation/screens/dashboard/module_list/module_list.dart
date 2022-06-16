import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:newapp/network/api.dart';
import 'package:newapp/presentation/styling/color.dart';
import 'package:newapp/presentation/styling/textstyle.dart';

import '../../../../custom widgets/category_tile.dart';

class ModuleListPage extends StatefulWidget {
  String? module;
  String? semester;
  String? year;
  ModuleListPage({this.module, this.semester, this.year, Key? key})
      : super(key: key);

  @override
  State<ModuleListPage> createState() => _ModuleListPageState();
}

class _ModuleListPageState extends State<ModuleListPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: IslingtonColors.L_RED,
      appBar: AppBar(
        title: Text("Module List"),
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
                    String newData = data["specialization"];
                    String yearData = data["year"];
                    return newData.contains(widget.module!) &&
                            newData.contains(widget.semester!) &&
                            yearData.contains(widget.year!)
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
                                      const Text("Module Name",
                                          style: StyleText.featureHeading),
                                      Text(
                                        "${data["moduleDto"]["name"]}",
                                        style: StyleText.categoryHeading,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      const Text("Module Code",
                                          style: StyleText.featureHeading),
                                      Text(
                                        "${data["moduleDto"]["code"]}",
                                        style: StyleText.categoryHeading,
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      const Text("Specialization",
                                          style: StyleText.featureHeading),
                                      Text(" ${data["specialization"]}",
                                          style: StyleText.categoryHeading),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      const Text("Teacher",
                                          style: StyleText.featureHeading),
                                      Text(" ${data["userDto"]["name"]}",
                                          style: StyleText.categoryHeading),
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
