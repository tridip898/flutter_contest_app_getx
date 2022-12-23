import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentContest extends StatefulWidget {
  const RecentContest({Key? key}) : super(key: key);

  @override
  State<RecentContest> createState() => _RecentContestState();
}

class _RecentContestState extends State<RecentContest> {
  List recent = [];
  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("lib/json/recent.json")
        .then((value) => setState(() {
              recent = json.decode(value);
            }));
  }

  @override
  void initState() {
    // TODO: implement initState
    _readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          title: Text("Latest Contest",style: TextStyle(fontSize: 25),),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Container(
            height: height,
            width: width,
            color: Colors.lightBlueAccent.shade100.withOpacity(0.3),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ListView.builder(
                itemCount: recent.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (_, index) {
                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.only(top: 20),
                    padding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Row(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(recent[index]['img']),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              recent[index]['status'],
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.orangeAccent,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                recent[index]['text'],
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                        Expanded(child: Container()),
                        Column(
                          children: [
                            Text(
                              recent[index]['time'],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade600),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                })),
      ),
    );
  }
}
