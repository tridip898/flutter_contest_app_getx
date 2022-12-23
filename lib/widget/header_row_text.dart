import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderRowText extends StatelessWidget {
  final String text;
  final IconData icon;
  void Function()? onPressed;
  HeaderRowText({Key? key, required this.text, required this.icon, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        Expanded(child: Container()),
        Text("See All",style: TextStyle(fontSize: 15,color: Colors.orangeAccent),),
        SizedBox(width: 5,),
        Container(
          decoration: BoxDecoration(
              color: Colors.orange, borderRadius: BorderRadius.circular(10)),
          child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                icon,
                color: Colors.white,
                size: 25,
              )),
        )
      ],
    );
  }
}
