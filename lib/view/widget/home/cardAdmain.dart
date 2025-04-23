import 'package:ecommercecourse/core/constant/imgaeasset.dart';
import 'package:flutter/material.dart';

class CardAdmin extends StatelessWidget {
  String imag;
  String title;
  void Function()? onTap;
  CardAdmin({
    Key? key,
    this.onTap,
    required this.imag,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "${imag}",
              width: 80,
            ),
            Text("${title}"),
          ],
        ),
      ),
    );
  }
}
