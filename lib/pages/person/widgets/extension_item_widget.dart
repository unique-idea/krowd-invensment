import 'package:flutter/material.dart';

Widget buildItemExtension(
        String imagePath,
        String textOne,
        String textTwo,
        double paddingLeftTextOne,
        double paddingRightTextOne,
        double paddingLeftTextTwo,
        double paddingRightTextTwo,
        double paddingLeftIcon,
        Icon icon) =>
    Row(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(5, 5, 0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          width: 15,
          height: 15,
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  paddingLeftTextOne, 5, paddingRightTextOne, 0),
              child: Text(
                textOne,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  paddingLeftTextTwo, 3, paddingRightTextTwo, 0),
              child: Text(
                textTwo,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 8),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 5,
            width: 10,
            margin: EdgeInsets.fromLTRB(paddingLeftIcon, 0, 0, 10),
            child: icon,
          ),
        ),
      ],
    );
