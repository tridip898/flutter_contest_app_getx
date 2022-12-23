import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/images/front.jpg"), fit: BoxFit.fill)),
          child: Stack(
            children: [
              Positioned(
                left: 20,
                bottom: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pick Your Favorite",
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Contests",
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: width - 25,
                      child: Text(
                        "We make great design work happen with our great community desginers",
                        style: TextStyle(
                            fontSize: 19, color: Colors.grey.shade300),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade700.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 5
                          )
                        ]
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          Get.to(()=>HomeScreen(),arguments: {
                            'key':'Welcome to Home Screen'
                          });
                        },
                        color: Colors.orange,
                        child: Text(
                          "Get Started",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        height: 50,
                        minWidth: 150,
                      ),
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
