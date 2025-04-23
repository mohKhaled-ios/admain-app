import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class Custombuttonabpar extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color coloritemselected;
  bool active = false;
  void Function() onPressed;
  Custombuttonabpar({
    Key? key,
    required this.icon,
    required this.title,
    required this.coloritemselected,
    required this.active,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: active == true ? AppColor.primaryColor : Colors.black,
          ),
          Text(
            '{$title}',
            style: TextStyle(
                color: active == true ? AppColor.primaryColor : Colors.black),
          )
        ],
      ),
    );
  }
}
