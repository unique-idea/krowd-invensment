import 'package:flutter/material.dart';

class GenderInputWidget extends StatefulWidget {
  final Icon icon;
  final double paddingLeftIcon;
  final double paddingTopIcon;
  final double paddingLeftTextOne;
  final double paddingTopTextOne;
  final String textOne;
  final double paddingLeftTextTwo;
  final double paddingTopTextTwo;
  final TextEditingController textTwo;

  const GenderInputWidget({
    super.key,
    required this.icon,
    required this.paddingLeftIcon,
    required this.paddingTopIcon,
    required this.paddingLeftTextOne,
    required this.paddingTopTextOne,
    required this.textOne,
    required this.paddingLeftTextTwo,
    required this.paddingTopTextTwo,
    required this.textTwo,
  });

  @override
  _GenderInputWidgetState createState() => _GenderInputWidgetState();
}

class _GenderInputWidgetState extends State<GenderInputWidget> {
  bool isFemaleChecked = false;
  bool isMaleChecked = false;

  @override
  void initState() {
    super.initState();
    isFemaleChecked = widget.textTwo.text == "FEMALE" ? true : false;
    isMaleChecked = widget.textTwo.text == "MALE" ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                widget.paddingLeftIcon, widget.paddingTopIcon, 0, 0),
            child: widget.icon,
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                widget.paddingLeftTextOne, widget.paddingTopTextOne, 0, 0),
            child: Text(
              widget.textOne,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12.0,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const Text(
                      "Female",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    ),
                    Checkbox(
                      value: isMaleChecked == true
                          ? false
                          : widget.textTwo.text == "FEMALE"
                              ? true
                              : false,
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            widget.textTwo.text = "FEMALE";
                            isFemaleChecked = true;
                          } else {
                            isFemaleChecked = false;
                          }
                        });
                      },
                    ),
                    const Text(
                      "Male",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    ),
                    Checkbox(
                      value: isFemaleChecked == true
                          ? false
                          : widget.textTwo.text == "MALE"
                              ? true
                              : false,
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            widget.textTwo.text = "MALE";
                            isMaleChecked = true;
                          } else {
                            isMaleChecked = false;
                          }
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
