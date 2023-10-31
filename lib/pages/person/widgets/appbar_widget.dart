import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, VoidCallback setTheme) {
  const icon = CupertinoIcons.moon_stars;
  return AppBar(
    title: const Text('Profile'),
    elevation: 0,
    actions: [
      IconButton(
        icon: const Icon(icon),
        onPressed: setTheme,
      ),
    ],
  );
}
