import 'dart:io';

import 'package:flutter/material.dart';
import 'package:krowd_invesment_footer/pages/person/profile.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    Key? key,
    required this.userData,
    required this.setUpdate,
  }) : super(key: key);

  final Map<String, dynamic>? userData;
  final VoidCallback setUpdate;
  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(widget.userData),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage(Map<String, dynamic>? userData) {
    final dynamic imageDefault;
    String url = userData!['avatar'] != null
        ? userData['avatar'].toString()
        : "/data/user/0/com.example.krowd_invesment_footer/app_flutter/images/image_1688456125915.png";

    if (url == "string") {
      imageDefault = const AssetImage("images/defaultavatar.png");
    } else {
      imageDefault = FileImage(File(url));
    }

    return ClipOval(
      child: Material(
        color: const Color.fromARGB(0, 255, 255, 255),
        child: Ink.image(
          image: imageDefault,
          fit: BoxFit.cover,
          width: 70,
          height: 70,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfileWidget(
                    userData: widget.userData,
                    setUpdate: widget.setUpdate,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: const Color.fromARGB(255, 29, 240, 247),
        all: 4,
        child: buildCircle(
          color: color,
          all: 5,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfileWidget(
                    userData: widget.userData,
                    setUpdate: widget.setUpdate,
                  ),
                ),
              );
            },
            child: const SizedBox(
              height: 5,
              width: 5,
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 7,
              ),
            ),
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
