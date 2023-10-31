import 'package:flutter/material.dart';

Widget buildItemsWallet(
        String textOne, String date, String textTwo, bool type) =>
    Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 15, 0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align date to the left
            children: [
              Text(
                textOne,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                date,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 100,
          ),
          Expanded(
            // Use Expanded widget to make textTwo take remaining space
            child: Align(
              alignment: Alignment.centerRight, // Align textTwo to the right
              child: Text(
                textTwo,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: type ? Colors.green : Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
