import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter_project/controller/detail_controller.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List img = [];
  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("lib/json/image.json")
        .then((s) => setState(() {
      img = json.decode(s);
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    _readData();
    super.initState();
  }
  final DetailController controller=Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color(0xfff6f7f8),
          child: Stack(
            children: [
              //background color
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 260,
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent.shade100,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                ),
              ),
              //back button
              Positioned(
                top: height*0.01,
                left: 10,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
              ),
              //profile
              Positioned(
                top: height*0.08,
                left: 20,
                right: 20,
                child: Container(
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
                                image: AssetImage(Get.arguments[5]['image']),
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
                            Get.arguments[2]['name'],
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
                          onPressed: () {
                            Get.snackbar(
                                'Notification', "Notification alert is ready",
                                backgroundColor: Colors.white);
                          },
                          icon: Icon(
                            Icons.notifications,
                            size: 30,
                            color: Colors.lightBlue,
                          ))
                    ],
                  ),
                ),
              ),
              //detail card
              Positioned(
                top: height*0.24,
                left: 20,
                right: 20,
                child: Container(
                  height: 240,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade300, blurRadius: 10)
                      ]),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Get.arguments[0]["title"],
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        Get.arguments[1]["subtitle"],
                        style: TextStyle(fontSize: 18),
                      ),
                      Divider(
                        height: 25,
                        thickness: 1.5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_filled,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Get.arguments[2]["name"],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    Get.arguments[4]["deadline"],
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey.shade600),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.monetization_on_sharp,
                                color: Colors.pinkAccent,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Get.arguments[3]["price"],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "prize",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey.shade600),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Top level",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Entry",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey.shade600),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: height*0.57,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Total Participants",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 05,
                        ),
                        Text(
                          "(11)",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.orange,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              //user number image
              Stack(
                children: [
                  for (int i = 0; i < img.length; i++)
                    Positioned(
                      top: height*0.62,
                      left: (20 + i * 40),
                      width: 55,
                      height: 55,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(img[i]['img']),
                                fit: BoxFit.cover)),
                      ),
                    )
                ],
              ),
              //favorite
              Positioned(
                top: height*0.73,
                left: 20,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.orange.shade400,
                          borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.all(05),
                      child: IconButton(
                          onPressed: () {
                            controller.favCounter();
                          },
                          icon: Icon(
                            Icons.favorite_border_rounded,
                            size: 32,
                            color: Colors.white,
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Add to favorite",
                      style: TextStyle(fontSize: 18, color: Colors.orange),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
