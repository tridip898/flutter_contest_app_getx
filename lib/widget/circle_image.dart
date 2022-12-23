import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CircleImage extends StatelessWidget {
  final String image;
  const CircleImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover)
      ),
    );
  }
}
