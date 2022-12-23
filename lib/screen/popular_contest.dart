import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularContest extends StatefulWidget {
  const PopularContest({Key? key}) : super(key: key);

  @override
  State<PopularContest> createState() => _PopularContestState();
}

class _PopularContestState extends State<PopularContest> {
  List info = [];

  _readData() async {
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
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          title: Text("Popular Contest List",style: TextStyle(fontSize: 25),),
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
                itemCount: info.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: (){
                      Get.toNamed('/detail/',arguments: [
                        {"title":info[index]['title']},
                        {"subtitle":info[index]['subtitle']},
                        {"name":info[index]['name']},
                        {"price":info[index]['price']},
                        {'deadline':info[index]['time']},
                        {"image":info[index]['img']}
                      ]);
                    },
                    child: Container(
                      height: height * 0.25,
                      width: width * 0.82,
                      margin: EdgeInsets.only(top: 10,bottom: 5),
                      decoration: BoxDecoration(
                          color: index.isEven
                              ? Colors.lightBlueAccent.shade200
                              : Colors.purple.shade200,
                          borderRadius: BorderRadius.circular(25)),
                      padding:
                      EdgeInsets.only(top: 15, left: 15, bottom: 10),
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
                                          image: AssetImage(
                                              info[index]['img']),
                                          fit: BoxFit.cover)),
                                )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                })),
      ),
    );
  }
}
