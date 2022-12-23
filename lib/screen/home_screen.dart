import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter_project/screen/popular_contest.dart';
import 'package:getx_flutter_project/screen/recent_contest.dart';

import '../widget/circle_image.dart';
import '../widget/header_row_text.dart';
import 'detail_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List list = [];
  List info = [];
  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("lib/json/recent.json")
        .then((s) => setState(() {
              list = json.decode(s);
            }));
    await DefaultAssetBundle.of(context)
        .loadString("lib/json/detail.json")
        .then((s) => setState(() {
              info = json.decode(s);
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
        body: Container(
          height: height,
          width: width,
          color: Colors.lightBlueAccent.shade100.withOpacity(0.4),
          padding: EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //profile
              Container(
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("lib/images/images2.jpg"),
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
                          "Tridip Bhowmik",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Developer",
                          style: TextStyle(
                              fontSize: 15, color: Colors.grey.shade500),
                        )
                      ],
                    ),
                    Expanded(child: Container()),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications,
                          size: 30,
                          color: Colors.lightBlue,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),

              //popular contest
              HeaderRowText(
                text: "Popular Contest",
                icon: Icons.arrow_forward_ios,
                onPressed: (){
                  Get.to(()=>PopularContest());
                },
              ),

              SizedBox(
                height: 10,
              ),
              //list
              SizedBox(
                height: height * 0.25,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: info.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed('/detail/', arguments: [
                          {"title": info[index]['title']},
                          {"subtitle": info[index]['subtitle']},
                          {"name": info[index]['name']},
                          {"price": info[index]['price']},
                          {"deadline": info[index]['time']},
                          {"image": info[index]['img']},
                        ]);
                      },
                      child: Container(
                        height: height * 0.23,
                        width: width * 0.82,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: index.isEven
                                ? Colors.lightBlueAccent.shade200
                                : Colors.purple.shade200,
                            borderRadius: BorderRadius.circular(25)),
                        padding: EdgeInsets.only(top: 15, left: 15, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              info[index]['title'],
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 08,
                            ),
                            Text(
                              info[index]['subtitle'],
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey.shade50),
                            ),
                            SizedBox(
                              height: 07,
                            ),
                            Divider(
                              thickness: 0.5,
                              color: Colors.grey.shade500,
                            ),
                            Row(
                              children: [
                                for (int index = 0; index < 4; index++)
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image:
                                                AssetImage(info[index]['img']),
                                            fit: BoxFit.cover)),
                                  )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(
                height: 10,
              ),

              //recent contest
              HeaderRowText(
                text: "Recent Contests",
                icon: Icons.arrow_forward_ios,
                onPressed: () {
                  Get.to(() => RecentContest());
                },
              ),

              //bottom list
              Expanded(
                child: ListView.builder(
                    itemCount: list.length,
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
                                      image: AssetImage(list[index]['img']),
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
                                  list[index]['status'],
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
                                    list[index]['text'],
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
                                  list[index]['time'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade600),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
